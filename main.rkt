#lang racket

(require db)
(require json)

(define DB "poetry.sqlite")
(define CONN (sqlite3-connect #:database DB #:mode 'create))

(query-exec
 CONN
 "CREATE TABLE IF NOT EXISTS poetry (title TEXT, author TEXT, contents TEXT);")

(define (insert title author contents)
  (query-exec CONN "insert into poetry values($1, $2, $3);" title author contents))

(for ([f (in-directory "chinese-poetry")])
  (when (regexp-match
         ;; poet.tang.0.json
         ;; ci.song.1000.json
         "(?:poet|ci)\\.(?:tang|song).[0-9]+\\.json"
         (path->string f))
    (printf "Processing ~a\n" f)
    (for ([h (in-list (with-input-from-file f
                        read-json))])
      (define title (or (hash-ref h 'title #f)
                        (hash-ref h 'rhythmic)))
      (define author (hash-ref h 'author))
      (define contents (string-join (hash-ref h 'paragraphs) "\n"))
      (insert title author contents))))

(disconnect CONN)
