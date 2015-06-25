
function pairMe(userPrimaryId, userCohort, pairHistory){
  // where userPrimaryId is a single user id asking to be paired
  // where userCohort is an array of user id for all cohort members inc primary!
  // where pairHistory is an array of arrays pairID, user id, date for cohort

  // Remove the userPrimaryId from userCohort
  var removePrimary = userCohort.indexOf(userPrimaryId);
  userCohort.splice(removePrimary, 1);

  // Return the remaining users in random order
  return shuffle(userCohort);

};

function shuffle(array) {
  var currentIndex = array.length, temporaryValue, randomIndex ;

  // While there remain elements to shuffle...
  while (0 !== currentIndex) {

    // Pick a remaining element...
    randomIndex = Math.floor(Math.random() * currentIndex);
    currentIndex -= 1;

    // And swap it with the current element.
    temporaryValue = array[currentIndex];
    array[currentIndex] = array[randomIndex];
    array[randomIndex] = temporaryValue;
  }

  return array;
};
