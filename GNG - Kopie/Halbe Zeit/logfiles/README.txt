Reaction times raw-data is actually no raw data, but rather structured as followed:

positive value > 1: correct answer
positive value = 1: answer was too short (< 300ms) and is thereby counted as false
negative value = -1: false, because of no reaction in go trial
negative value < -1: false, because of reaction in noGo trial
			