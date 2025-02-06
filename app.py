import gradio as gr
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.preprocessing import LabelEncoder
import seaborn as sns

def load_data():
    data = {}
    years = range(2015, 2023)
    for year in years:
        batting_file = f"./Datasets/{year} data/{year}_league_batting.csv"
        pitching_file = f"./Datasets/{year} data/{year}_league_pitching.csv"
        
        batting_data = pd.read_csv(batting_file)
        pitching_data = pd.read_csv(pitching_file)
        
        data[f"{year}_batting"] = batting_data
        data[f"{year}_pitching"] = pitching_data
    return data

data = load_data()
all_teams = sorted(data['2015_pitching']['Finals'].tolist())

def train_win_probability_model(data):
    df_list = []
    for year in range(2015, 2023):
        df = data[f"{year}_pitching"].copy()
        df["Win_Percentage"] = df["W"] / (df["W"] + df["L"])  # Create win probability column
        df_list.append(df)
    
    full_data = pd.concat(df_list, axis=0)
    features = ["ERA", "SO", "WHIP"]  # Key indicators of team performance
    
    X = full_data[features]
    y = (full_data["Win_Percentage"] > 0.5).astype(int)  # Convert to binary target (Win=1, Lose=0)
    
    model = LogisticRegression()
    model.fit(X, y)
    return model

win_probability_model = train_win_probability_model(data)

def calculate_win_probability(pitching_data, team_a, team_b):
    team_a_stats = pitching_data[pitching_data["Finals"] == team_a][["ERA", "SO", "WHIP"]]
    team_b_stats = pitching_data[pitching_data["Finals"] == team_b][["ERA", "SO", "WHIP"]]

    # Predict probability of winning
    prob_a = win_probability_model.predict_proba(team_a_stats)[0][1]  # Probability of team A winning
    prob_b = win_probability_model.predict_proba(team_b_stats)[0][1]  # Probability of team B winning
    
    return round(prob_a * 100, 2), round(prob_b * 100, 2)  # Convert to percentage

def train_predictive_model(data):
    df_list = []
    for year in range(2015, 2023):
        df = data[f"{year}_pitching"].copy()
        df["Year"] = year
        df_list.append(df)
    
    full_data = pd.concat(df_list, axis=0)
    features = ["W", "L", "ERA", "SO", "WHIP"]  
    
    X = full_data[features]
    y = full_data[features]
    
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
    model = RandomForestRegressor(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    return model

predictive_model = train_predictive_model(data)




def predict_match_performance(team_a, team_b):
    last_known_data_a = data["2022_pitching"][data["2022_pitching"]["Finals"] == team_a]
    last_known_data_b = data["2022_pitching"][data["2022_pitching"]["Finals"] == team_b]
    
    if last_known_data_a.empty or last_known_data_b.empty:
        return "Team data not available for predictions."
    
    features = ["W", "L", "ERA", "SO", "WHIP"]
    
    X_a = last_known_data_a[features]
    X_b = last_known_data_b[features]
    
    prediction_a = predictive_model.predict(X_a)[0]
    prediction_b = predictive_model.predict(X_b)[0]
    
    predicted_values_a = {feature: round(value, 2) for feature, value in zip(features, prediction_a)}
    predicted_values_b = {feature: round(value, 2) for feature, value in zip(features, prediction_b)}
    
    # Convert to DataFrame for better presentation
    df_results = pd.DataFrame([predicted_values_a, predicted_values_b], index=[team_a, team_b])
    
    # Determine the winner based on W/L ratio
    win_ratio_a = predicted_values_a["W"] / (predicted_values_a["W"] + predicted_values_a["L"])
    win_ratio_b = predicted_values_b["W"] / (predicted_values_b["W"] + predicted_values_b["L"])
    
    winner = team_a if win_ratio_a > win_ratio_b else team_b
    win_probability = round((max(win_ratio_a, win_ratio_b) / (win_ratio_a + win_ratio_b)) * 100, 2)
    winner_text = f"Predicted Winner: {winner} with {win_probability}% probability"
    
    # Historical Performance Visualization
    fig, ax = plt.subplots(figsize=(12, 6))
    try:
        team_history = pd.concat(
        [data[f"{year}_pitching"][data[f"{year}_pitching"]["Finals"] == team_a].assign(Year=year) for year in range(2015, 2023)]
        )
        team_history_b = pd.concat(
        [data[f"{year}_pitching"][data[f"{year}_pitching"]["Finals"] == team_b].assign(Year=year) for year in range(2015, 2023)]
        )
        
        if "Year" in team_history.columns and "Year" in team_history_b.columns:
            sns.lineplot(data=team_history, x="Year", y="W", label=team_a, ax=ax)
            sns.lineplot(data=team_history_b, x="Year", y="W", label=team_b, ax=ax)
            ax.set_title(f"Historical Wins: {team_a} vs {team_b}")
            ax.set_ylabel("Wins")
            ax.legend()
        else:
            ax.text(0.5, 0.5, "Year column missing in dataset", fontsize=12, ha='center')
    except Exception as e:
        ax.text(0.5, 0.5, f"Error generating chart: {str(e)}", fontsize=12, ha='center')
    
    return df_results, fig, winner_text


demo = gr.Interface(
    fn=predict_match_performance,
    inputs=[gr.Dropdown(choices=all_teams, label="Your Team"),
            gr.Dropdown(choices=all_teams, label="Opponent Team")],
    outputs=[gr.Dataframe(label="Predicted Performance Comparison"),
             gr.Plot(label="Historical Wins Over the Years"),
             gr.Textbox(label="Predicted Winner and Probability")],
    title="KBO Match Performance Prediction",
    theme="dark"
)

demo.launch()

