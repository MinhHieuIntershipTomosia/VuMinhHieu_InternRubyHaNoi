//= require jquery
$.getScript("https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js", function () {
  var xValues = ["ThanskCard", "My Submissions", "My Receipts"];
  var yValues = [55, 49, 44];
  var barColors = [
    "#b91d47",
    "#00aba9",
    "#2b5797"
  ];

  new Chart("myChart", {
    type: "pie",
    data: {
      labels: xValues,
      datasets: [{
        backgroundColor: barColors,
        data: yValues
      }]
    },
    options: {
      title: {
        display: true,
        text: "World Wide Wine Production 2018"
      }
    }
  });
});