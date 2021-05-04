<p align="center">
  <a href="https://mikeq0621.github.io/COSI166_team11/">
    <img src="../app/assets/images/AirStorageIcon2.png" alt="Logo" width="80" height="80">
  </a>
  <h1 align="center">Team 11: AirStorage: Further Improvement</h1>
  <p align="center">
    COSI 166b Term Project
    <br>
    <a href="https://airstorage.herokuapp.com/">Heroku Deployment</a>
    <br>
    <a href="https://github.com/Mikeq0621/COSI166_team11">Github Repository</a>
    <br>
    <a href="https://mikeq0621.github.io/COSI166_team11/">Back to Github page</a>
  </p>
</p>

# Change on durations of transactions
As briefly mentioned, we simple used an integer number for storage duration weeks. In current implementation, that number will not change as time goes. If the storage time is up, there will be not coresponding changes to end this transaction neither. The system requires the host to track the storage time, and manually end this transaction.

We noticed this problem in the last two weeks, when we finished all essential transaction and searching functionalities. We realized that it would be a major change to our transaction system and database. At that point, we did not have enough time to make further improvements.

# Automatical closure for completed transactions
This improvement is closely related to change of duration time field. If we managed to implement the starting and endding data, then it would be reasonale to implement some further functionalities to deal with some finished transcations. The system would close those transactions and update the rental options automatically. One other problem would be dealing with real time flow in our application. So far our transaction system is static in the sense of time flow, we should think of a way to deal with time changes in our app.

# Payment system
We had a price relating to a rental option. It would be reasonalbe to add a payment system, yet the challenge is that a real payment system would be hard to test, and with more risk if the our application contains any valued personal informations.
