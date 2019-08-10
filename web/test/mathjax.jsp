<!DOCTYPE html>
<html>
<head>
<title>MathJax Test Page</title>
<!-- Copyright (c) 2009-2016 The MathJax Consortium -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">

<script type="text/x-mathjax-config">
  MathJax.Hub.Config({
    extensions: ["tex2jax.js"],
    jax: ["input/TeX","output/HTML-CSS"],
    tex2jax: {inlineMath: [["$","$"],["\\(","\\)"]]}
  });
</script>
<script type="text/javascript" src="../MathJax-2.7.0/MathJax.js"></script>
</head>
<body>
    <h1>Math jax Testing</h1>
<p>
    what is the name of  :- \begin{align}
\dot{x} & = \sigma(y-x) \\
\dot{y} & = \rho x - y - xz \\
\dot{z} & = -\beta z + xy
\end{align}
</p>
</body>
</html>

