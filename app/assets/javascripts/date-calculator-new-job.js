// $(document).ready(function() {
  function calcMonth() {
    var month_start = $('#job_start_date_2i').val();
    var month_deadline = $('#job_deadline_2i').val();

    var start = parseInt(month_start);
    var deadline = parseInt(month_deadline);

    $('#duration-form').append('<b>' + (deadline - start) + '</b>' + ' months');
    // console.log(deadline - start);
  };
// });

// function calcYear() {
//     var year_start = $('#job_start_date_1i').val();
//     var year_deadline = $('#job_deadline_1i').val();

//     var start = parseInt(year_start);
//     var deadline = parseInt(year_deadline);

//     $('#duration-form').append('Duration: ' + '<b>' + (deadline - start) + '</b>');
//     // console.log(deadline - start);
//   };


$('select').change( function() {
  calcMonth()
});
