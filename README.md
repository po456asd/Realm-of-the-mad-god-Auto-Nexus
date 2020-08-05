I made this because i just died on main charater btw

Instruction :
1.Open a game
2.Open AHK script
3.Switching to game window
4.Move your mouse at around 40-50% HP then press Ctrl+Num5
5.Move your mouse at around 80-99% HP then press Ctrl+Num6
6.Press Ctrl+Num8 to make it work if you want to stop either press F11 or Ctrl+Num8
Use F12 to exit a program

<div id="paypal-button-container"></div>
<script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD" data-sdk-integration-source="button-factory"></script>
<script>
  paypal.Buttons({
      style: {
          shape: 'rect',
          color: 'gold',
          layout: 'vertical',
          label: 'paypal',
          
      },
      createOrder: function(data, actions) {
          return actions.order.create({
              purchase_units: [{
                  amount: {
                      value: '1'
                  }
              }]
          });
      },
      onApprove: function(data, actions) {
          return actions.order.capture().then(function(details) {
              alert('Transaction completed by ' + details.payer.name.given_name + '!');
          });
      }
  }).render('#paypal-button-container');
</script>
