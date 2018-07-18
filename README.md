SQLite 格式的 [chinese-poetry](https://github.com/chinese-poetry/chinese-poetry)

    $ sqlite3 poetry.sqlite
    SQLite version 3.19.3 2017-06-27 16:48:08
    Enter ".help" for usage hints.
    sqlite> .tables
    poetry
    sqlite> PRAGMA table_info(poetry);
    0|title|TEXT|0||0
    1|author|TEXT|0||0
    2|contents|TEXT|0||0
    sqlite> select * from poetry where author = '李清照' and title = '声声慢';
    声声慢|李清照|寻寻觅觅，冷冷清清，凄凄惨惨戚戚。
    乍暖还寒时候，最难将息。
    三杯两盏淡酒，怎敌他、晚来风急。
    雁过也，正伤心，却是旧时相识。
    满地黄花堆积。
    憔悴损，如今有谁摘。
    守著窗儿，独自怎生得黑。
    梧桐更兼细雨，到黄昏、点点滴滴。
    这次第，怎一个、愁字了得。
    sqlite> select count(1) from poetry;
    332875
    sqlite>
