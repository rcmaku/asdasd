    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 600px;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .order-summary,
        .payment-details {
            margin-bottom: 20px;
        }

        .order-summary table,
        .payment-details table {
            width: 100%;
            border-collapse: collapse;
        }

        .order-summary th,
        .order-summary td,
        .payment-details th,
        .payment-details td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .order-summary th,
        .payment-details th {
            background-color: #007BFF;
            color: #fff;
        }

        .total {
            text-align: right;
            font-size: 18px;
            font-weight: bold;
        }

        .button-container {
            text-align: center;
        }

        .button-container button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .button-container button:hover {
            background-color: #0056b3;
        }
                footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color: #007BFF;
            color: #FFFFFF;
            padding: 10px 0;
        }
    </style>

    <script src="script.js"></script>
  </head>
  <body>
    <div class="container">
      <div class="row">
        <div class="col-sm"></div>
        <div class="col-sm">

          <div id="alerts" class="ms-text-center"></div>
          <div id="loading" class="spinner-container ms-div-center">
            <div class="spinner"></div>
          </div>
          <div id="content" class="hide">
            <div class="ms-card ms-fill">
              <div class="ms-card-content">
                <h2>Checkout</h2>
  <div class="order-summary">
    <h3>Order Summary</h3>
    <table>
      <thead>
        <tr>
          <th>Item</th>
          <th>Quantity</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
        {{foreach cart}}
            <tr>

            </tr>
        {{endfor cart}}
      </tfoot>
    </table>
  </div>
  <div class="payment-details">
    <h3>Payment Details</h3>
    <table>
      <tbody>
        <tr>
          <td>Card Number:</td>
          <td><input type="text" placeholder="1234 5678 9012 3456"></td>
        </tr>
        <tr>
          <td>Expiry Date:</td>
          <td><input type="text" placeholder="MM/YY"></td>
        </tr>
        <tr>
          <td>CVV:</td>
          <td><input type="text" placeholder="123"></td>
        </tr>
      </tbody>
    </table>
  </div>

              </div>
            </div>
            <div id="payment_options"></div>
          </div>
        </div>
        <div class="col-sm"></div>
      </div>
    </div>
  </body>
</html>