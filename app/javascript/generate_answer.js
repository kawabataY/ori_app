document.addEventListener('DOMContentLoaded', function() {
  var contentInput = document.getElementById('content-input');

  document.getElementById('question-form').addEventListener('submit', function(event) {
    event.preventDefault();

    var question = document.getElementById('question-input').value;
    var authenticityToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch('/rooms/' + roomId + '/shoppinglists/generate_answer.json', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': authenticityToken
      },
      body: JSON.stringify({ question: question })
    })
      .then(function(response) {
        if (!response.ok) {
          throw new Error('Network response was not ok');
        }
        return response.json();
      })
      .then(function(data) {
        var answer = data.answer;
        var answerContainer = document.getElementById('answer-container');
        answerContainer.innerHTML = '';
        if (answer) {
          contentInput.value = answer;
        }
      })
      .catch(function(error) {
        console.error(error);
      });
  });
});