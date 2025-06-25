const express = require('express');
const app = express();
app.get('/', (req, res) => res.send('Hello from Express in ECS on port 3000'));
app.listen(3000);
