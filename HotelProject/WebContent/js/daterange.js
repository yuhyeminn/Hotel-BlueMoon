$(function() {
  'use strict';

  var checkIn, checkOut, numberOfMonths = [2, 3],
      $calendar = $('#calendar').datepicker({
        numberOfMonths: numberOfMonths,
        prevText: '',
        nextText: '',
        beforeShowDay: function(date) {
          date = moment(date);

          var now = moment(),
              show = date.isAfter(now),
              css = '';

          if (checkIn && checkOut 
              && date.isSameOrAfter(checkIn)
              && date.isSameOrBefore(checkOut)) {
            css = 'ui-datepicker-reserved';

            if (date.isSame(checkIn)) css += ' ui-datepicker-checkin';
            if (date.isSame(checkOut)) css += ' ui-datepicker-checkout';
          }

          return [show, css];
        },
        onSelect: function(value) {
          var date = moment($calendar.datepicker('getDate'));

          if (checkIn && !checkOut
              && date.isSameOrAfter(checkIn)) 
            checkOut = date;
          else {
            checkIn = date;
            checkOut = null;
          }
          
          $('#check-in-date').text(checkIn ? checkIn.format('YYYY-MM-DD') : '날짜를 선택하세요');
          $('#check-out-date').text(checkOut ? checkOut.format('YYYY-MM-DD') : '날짜를 선택하세요');
          
          if($('#checkin-date')!=null){
        	  $('#checkin-date').text(checkIn ? checkIn.format('YYYY-MM-DD') : '날짜 선택');
          }
          if($('#checkout-date')!=null){
        	  $('#checkout-date').text(checkOut ? checkOut.format('YYYY-MM-DD') : '날짜 선택');
          }
          $('[name=checkin-date]').val(checkIn ? checkIn.format('YYYY-MM-DD') : null);
          $('[name=checkout-date]').val(checkOut ? checkOut.format('YYYY-MM-DD') : null);
        },
        onChangeMonthYear: function() {
          $calendar.addClass('fade-in');
        }
      }).on('animationend webkitAnimationEnd', function() {
        $calendar.removeClass('fade-in');
      });
  
  function resize() {
    var element = $('.ui-datepicker').get(0),
        style = window.getComputedStyle(element).getPropertyValue('min-width'), 
        value;
    
    switch (style) {
      case '765px': value = [1, 2]; break;
      case '510px': value = [1, 2]; break;
      default: value = [1, 2]; break;
    }
    
    if (numberOfMonths !== value) {
      if (checkIn) $calendar.datepicker('setDate', checkIn.toDate());
      
      $calendar.datepicker('option', 'numberOfMonths', numberOfMonths = value);
    }
  }

  $(window).on('resize', resize);
  
  resize();
});
