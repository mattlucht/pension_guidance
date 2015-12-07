(function($) {
  'use strict';

  var calculators = {
    init: function() {
      var $calculator = $('.js-calculator form');

      $calculator.append('<div class="calculator__result" aria-live="polite"></div>');

      $calculator.on('submit', function(event) {
        event.preventDefault();
        $.get($calculator.attr('action'), $(this).serialize(), function(data) {
          $('.calculator__result').html(data);

          $('html, body').animate({
              scrollTop: $calculator.find('input[type="submit"]').offset().top
          }, 700);

          $('.calculator__result .btn-link').on('click', function(event) {
            event.preventDefault();
            $(this).remove();
            $('.calculator__result .visuallyhidden').removeClass('visuallyhidden');
          });
        });
      });
    }
  };

  window.PWPG = window.PWPG || {};
  window.PWPG.calculators = calculators;
})(jQuery);
