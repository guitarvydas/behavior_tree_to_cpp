(with-input-from-string
    (s "[{\"foo\": [1, 2, 3], \"bar\": true, \"baz\": \"!\"},{\"foo\": [1, 2, 3], \"bar\": true, \"baz\": \"!\"},{}]")
  (json:decode-json s))
