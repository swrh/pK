/**
 * 
 */

$('input:text').bind('focus blur', function() {
    $(this).toggleClass('highlight');
});

$(':input:visible').each(i,e){ $(e).attr('tabindex, i) });