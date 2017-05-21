// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require_tree .


$(document).on('turbolinks:load', function () {
  $('[data-add-news-letter-filter]').on('click', function (e) {
    console.log($(this));
    var tablerow = '<tr>' +
      '<td>' +
        '<select name="newsletter[filters][][prop_name]" id="newsletter_filters__prop_name">' +
          '<option value=""></option>' +
          '<option value="name">name</option>' +
          '<option value="vk_id">vk_id</option>' +
          '<option value="level">level</option>' +
          '<option value="last_visit">last_visit</option>' +
          '<option value="paid">paid</option></select>' +
      '</td>' +
      '<td>' +
        '<select name="newsletter[filters][][logic]" id="newsletter_filters__logic">' +
          '<option value=""></option>' +
          '<option value="eq">eq</option>' +
          '<option value="gteq">gteq</option>' +
          '<option value="lteq">lteq</option>' +
        '</select>' +
      '</td>' +
      '<td><input type="text" name="newsletter[filters][][value]" id="newsletter_filters__value" value=""></td>' +
      '<td><a data-remove-news-letter-filter-item="" href="#">remove</a></td>' +
      '</tr>';


    $(this).parents('table').find('tbody').append(tablerow);
    return false;
  });

  $(document).on('click','[data-remove-news-letter-filter-item]',function(){
    $(this).parents('tr').remove();
    return false;
  })
});