// $(document).ready(function() {
  function calcMonth() {
    var month_start = $('#job_start_date_2i').val();
    var month_deadline = $('#job_deadline_2i').val();

    var start = parseInt(month_start);
    var deadline = parseInt(month_deadline);

    $('#duration-form').html('Duration (in months): ' + (deadline - start));
    // console.log(deadline - start);
  };
// });
$('select').change( function() {
  calcMonth()
});
