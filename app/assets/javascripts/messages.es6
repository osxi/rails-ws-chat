$(document).ready(() => {
  $.get('/ws_host').then(res => {
    console.log('WebSockets config: ', res);

    var ws = new WebSocketRails(`${res.host}:${res.port}/websocket`);

    var messages = ws.subscribe('messages');

    messages.bind('new', message => {
      $('#messages').append(`<li>${message.body}</li>`);
    });

    $('#new-message-form').on('submit', e => {
      e.preventDefault();

      var $body = $(e.target).find("input[name='body']");

      ws.trigger('messages.create', {
        body: $body.val()
      }, message => {
        console.log('successfully created message: ', message);
        $body.val('');
      }, err => {
        console.log('something went wrong: ', err);
      });
    });
  });
});
