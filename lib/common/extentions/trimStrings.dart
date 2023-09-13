String trimMovieTitle(String title) {
  if (title.length > 15) {
    return '${title.substring(0, 15)}...'; // Truncate and add ellipsis
  }
  return title; // Return original title if not greater than 15 characters
}

String trimMovieVote(String vote) {
  if (vote.length > 4) {
    return vote.substring(0, 4);
  }
  return vote;
}