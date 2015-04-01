# Custom JS for the admin area

$(document).ready ->

  # Removing comments from Comfy Blog
  $('a[href$="/comments"]').hide();
  $('a.btn[href$="/comments"]').hide();
  $('th:contains(Comments)').text('');
  $('td a.btn[href*="/comments"]').css('visibility', 'hidden');