//= require jquery
const count_all = document.getElementById('count_thankscard').value
const count_sent = document.getElementById('count_send').value
const count_receiver = document.getElementById('count_receiver').value

$.getScript("https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js", function () {
  var xValues = ["ThanskCard", "My Submissions", "My Receipts"];
  var yValues = [count_all, count_sent, count_receiver];
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
        text: "my thankscard chart"
      }
    }
  });
});