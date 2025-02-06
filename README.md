# KBO Match Performance Prediction

## Overview
This project is a **KBO (Korean Baseball Organization) Match Performance Predictor**, which allows users to select two baseball teams and predict their key performance statistics if they were to play against each other. The tool also provides a probability score for winning and a historical performance comparison.

Try it here: https://huggingface.co/spaces/MrAR/KBO-Score

## Features
- **Team Selection:** Choose two teams from a dropdown menu.
- **Performance Prediction:** Predict key stats including Wins, Losses, ERA, Strikeouts, and WHIP.
- **Winning Probability:** Calculates the probability of each team winning.
- **Historical Performance:** Displays a trend of the selected teams' past performances.
- **User-Friendly Interface:** Built using Gradio with an intuitive design.

## Technologies Used
- **Python**
- **Pandas** (for data manipulation)
- **NumPy** (for calculations)
- **Matplotlib & Seaborn** (for visualization)
- **Scikit-Learn** (for predictive modeling)
- **Gradio** (for building the user interface)

## Dataset
The data used in this project includes KBO team statistics from **2015 to 2022**, sourced from structured CSV files stored in a Hugging Face Space repository. The data consists of:
- **Batting Data** (`*_league_batting.csv`)
- **Pitching Data** (`*_league_pitching.csv`)

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/your-repo/kbo-predictor.git
   cd kbo-predictor
   ```
2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Run the application:
   ```sh
   python app.py
   ```
4. Open the Gradio interface in your browser and start predicting!

## Usage
1. Select **Team A** and **Team B** from the dropdown menu.
2. Click **Predict** to generate the statistical comparison.
3. View the predicted **performance table** and **winning probability**.
4. Check the **historical performance chart** for trends.

## Model & Prediction Approach
- A **Random Forest Regressor** is used for predicting key performance metrics.
- **Logistic Regression** is implemented for predicting win probability.
- Historical data is used to improve the accuracy of predictions.

## Future Enhancements
- **Incorporate More Features** (home/away performance, weather conditions, etc.).
- **Use Deep Learning Models** for better accuracy.
- **Allow Custom Year Selection** for predictions beyond 2022.
- **Improve Visualization** with interactive charts.

## License
This project is licensed under the **MIT License**.

## Contributors
- **Your Name** - Developer & Maintainer

## Contact
For any questions or contributions, feel free to reach out at **your.email@example.com**.

# KBO Match Performance Prediction

## Overview
This project is a **KBO (Korean Baseball Organization) Match Performance Predictor**, which allows users to select two baseball teams and predict their key performance statistics if they were to play against each other. The tool also provides a probability score for winning and a historical performance comparison.

## Features
- **Team Selection:** Choose two teams from a dropdown menu.
- **Performance Prediction:** Predict key stats including Wins, Losses, ERA, Strikeouts, and WHIP.
- **Winning Probability:** Calculates the probability of each team winning.
- **Historical Performance:** Displays a trend of the selected teams' past performances.
- **User-Friendly Interface:** Built using Gradio with an intuitive design.

## Technologies Used
- **Python**
- **Pandas** (for data manipulation)
- **NumPy** (for calculations)
- **Matplotlib & Seaborn** (for visualization)
- **Scikit-Learn** (for predictive modeling)
- **Gradio** (for building the user interface)

## Dataset
The data used in this project includes KBO team statistics from **2015 to 2022**, sourced from structured CSV files stored in a Hugging Face Space repository. The data consists of:
- **Batting Data** (`*_league_batting.csv`)
- **Pitching Data** (`*_league_pitching.csv`)

## Installation & Setup
1. Clone the repository:
   ```sh
   git clone https://github.com/ArnavAgarwal-Mr-AR/KBO-Score.git
   cd KBO-Score
   ```
2. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```
3. Run the application:
   ```sh
   python app.py
   ```
4. Open the Gradio interface in your browser and start predicting!

## Usage
1. Select **Team A** and **Team B** from the dropdown menu.
2. Click **Predict** to generate the statistical comparison.
3. View the predicted **performance table** and **winning probability**.
4. Check the **historical performance chart** for trends.

## Model & Prediction Approach
- A **Random Forest Regressor** is used for predicting key performance metrics.
- **Logistic Regression** is implemented for predicting win probability.
- Historical data is used to improve the accuracy of predictions.

## Future Enhancements
- **Incorporate More Features** (home/away performance, weather conditions, etc.).
- **Use Deep Learning Models** for better accuracy.
- **Allow Custom Year Selection** for predictions beyond 2022.
- **Improve Visualization** with interactive charts.


## Contact me 📪
<div id="badges">
  <a href="https://www.linkedin.com/in/arnav-agarwal-571a59243/" target="blank">
   <img src="https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Badge"/>
  </a>
 <a href="https://www.instagram.com/arnav_executes?igsh=MWUxaWlkanZob2lqeA==" target="blank">
 <img src="https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white"  alt="Instagram Badge" />
 </a>
 </a>
 <a href="https://medium.com/@arumynameis" target="blank">
 <img src="https://img.shields.io/badge/Medium-12100E?style=for-the-badge&logo=medium&logoColor=white"  alt="Medium Badge" />
 </a>
</div>
