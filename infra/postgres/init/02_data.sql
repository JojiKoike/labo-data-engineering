\c sql_recipe
DROP TABLE IF EXISTS search_result;
CREATE TABLE search_result(
    keyword varchar(255)
  , rank    integer
  , item    varchar(255)
);

INSERT INTO search_result
  VALUES
    ('sql'     ,  1, 'book001')
  , ('sql'     ,  2, 'book005')
  , ('sql'     ,  3, 'book012')
  , ('sql'     ,  4, 'book004')
  , ('sql'     ,  5, 'book003')
  , ('sql'     ,  6, 'book010')
  , ('sql'     ,  7, 'book024')
  , ('sql'     ,  8, 'book025')
  , ('sql'     ,  9, 'book050')
  , ('sql'     , 10, 'book100')
  , ('postgres',  1, 'book002')
  , ('postgres',  2, 'book004')
  , ('postgres',  3, 'book012')
  , ('postgres',  4, 'book008')
  , ('postgres',  5, 'book003')
  , ('postgres',  6, 'book010')
  , ('postgres',  7, 'book035')
  , ('postgres',  8, 'book040')
  , ('postgres',  9, 'book077')
  , ('postgres', 10, 'book100')
  , ('hive'    ,  1, 'book200')
;

DROP TABLE IF EXISTS correct_result;
CREATE TABLE correct_result(
    keyword  varchar(255)
  , item  varchar(255)
);

INSERT INTO correct_result
VALUES
    ('sql'     , 'book003')
  , ('sql'     , 'book005')
  , ('sql'     , 'book008')
  , ('sql'     , 'book010')
  , ('sql'     , 'book025')
  , ('sql'     , 'book100')
  , ('postgres', 'book008')
  , ('postgres', 'book010')
  , ('postgres', 'book030')
  , ('postgres', 'book055')
  , ('postgres', 'book066')
  , ('postgres', 'book100')
  , ('hive'    , 'book200')
  , ('redshift', 'book300')
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp      timestamp
  , session    varchar(255)
  , action     varchar(255)
  , keyword    text
  , url        text
  , referrer   text
  , result_num integer
);

INSERT INTO access_log
VALUES
    ('2017-01-05 23:35:13', '0CVKaz', 'search', 'mynavi quest2'                       , 'http://www.example.com/search_result?q=mynavi+quest'                        , ''                                                                         ,   0 )
  , ('2017-01-05 23:36:08', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:37:17', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=170'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:38:38', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=133'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:40:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:41:43', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=64'                                        , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:43:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:34:57', '1QceiB', 'search', 'yamada taro'                         , 'http://www.example.com/search_result?q=yamada+taro'                         , ''                                                                         , 367 )
  , ('2017-01-05 23:35:37', '1QceiB', 'search', 'yamada taro football'                , 'http://www.example.com/search_result?q=yamada+taro+football'                , ''                                                                         , 105 )
  , ('2017-01-05 23:36:48', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=99'                                        , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:37:27', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=142'                                       , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:38:52', '1QceiB', 'search', 'yamada taro football transfers'      , 'http://www.example.com/search_result?q=yamada+taro+football+transfers'      , ''                                                                         ,  50 )
  , ('2017-01-05 23:39:50', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=7'                                         , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:41:23', '1QceiB', 'search', 'yamada taro football transfers where', 'http://www.example.com/search_result?q=yamada+taro+football+transfers+where', ''                                                                         ,   0 )
  , ('2017-01-05 23:34:39', '1hI43A', 'search', 'english'                             , 'http://www.example.com/search_result?q=english'                             , ''                                                                         , 343 )
  , ('2017-01-05 23:36:08', '1hI43A', 'search', 'history of english'                  , 'http://www.example.com/search_result?q=history+of+english'                  , ''                                                                         , 757 )
  , ('2017-01-05 23:36:39', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=9'                                         , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:38:10', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=137'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:39:17', '1hI43A', 'search', 'history of english origin'           , 'http://www.example.com/search_result?q=history+of+english+origin'           , ''                                                                         , 963 )
  , ('2017-01-05 23:40:04', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=158'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:40:52', '1hI43A', 'search', 'history of english england'          , 'http://www.example.com/search_result?q=history+of+english+england'          , ''                                                                         , 303 )
  , ('2017-01-06 23:34:36', '2bGs3i', 'search', 'nail'                                , 'http://www.example.com/search_result?q=nail'                                , ''                                                                         , 730 )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manikure'                            , 'http://www.example.com/search_result?q=manikure'                            , ''                                                                         , 0   )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manicure'                            , 'http://www.example.com/search_result?q=manicure'                            , ''                                                                         , 64  )
  , ('2017-01-06 23:36:33', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=123'                                       , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:01', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=11'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:52', '2bGs3i', 'search', 'manicure red'                        , 'http://www.example.com/search_result?q=manicure+red'                        , ''                                                                         , 827 )
  , ('2017-01-06 23:40:17', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=56'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:41:14', '2bGs3i', 'search', 'manicure dark red'                   , 'http://www.example.com/search_result?q=manicure+dark+red'                   , ''                                                                         , 920 )
  , ('2017-01-06 23:34:54', '2mmGwD', 'search', 'fab'                                 , 'http://www.example.com/search_result?q=fab'                                 , ''                                                                         , 646 )
  , ('2017-01-06 23:35:29', '2mmGwD', 'search', 'fabulous'                            , 'http://www.example.com/search_result?q=fabulous'                            , 'http://www.example.com/search_result?q=fab'                               , 179 )
  , ('2017-01-06 23:36:49', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=87'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:38:14', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=24'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:39:08', '2mmGwD', 'search', 'fabulous how to use'                 , 'http://www.example.com/search_result?q=fabulous+how+to+use'                 , ''                                                                         , 856 )
  , ('2017-01-06 23:40:05', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=51'                                        , 'http://www.example.com/search_result?q=fabulous+how+to+use'               , NULL)
  , ('2017-01-06 23:41:34', '2mmGwD', 'search', 'fabulous synonym'                    , 'http://www.example.com/search_result?q=fabulous+synonym'                    , ''                                                                         , 875 )
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp      timestamp
  , session    varchar(255)
  , action     varchar(255)
  , keyword    text
  , url        text
  , referrer   text
  , result_num integer
);

INSERT INTO access_log
VALUES
    ('2017-01-05 23:35:13', '0CVKaz', 'search', 'mynavi quest2'                       , 'http://www.example.com/search_result?q=mynavi+quest'                        , ''                                                                         ,   0 )
  , ('2017-01-05 23:36:08', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:37:17', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=170'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:38:38', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=133'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:40:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:41:43', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=64'                                        , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:43:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:34:57', '1QceiB', 'search', 'yamada taro'                         , 'http://www.example.com/search_result?q=yamada+taro'                         , ''                                                                         , 367 )
  , ('2017-01-05 23:35:37', '1QceiB', 'search', 'yamada taro football'                , 'http://www.example.com/search_result?q=yamada+taro+football'                , ''                                                                         , 105 )
  , ('2017-01-05 23:36:48', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=99'                                        , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:37:27', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=142'                                       , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:38:52', '1QceiB', 'search', 'yamada taro football transfers'      , 'http://www.example.com/search_result?q=yamada+taro+football+transfers'      , ''                                                                         ,  50 )
  , ('2017-01-05 23:39:50', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=7'                                         , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:41:23', '1QceiB', 'search', 'yamada taro football transfers where', 'http://www.example.com/search_result?q=yamada+taro+football+transfers+where', ''                                                                         ,   0 )
  , ('2017-01-05 23:34:39', '1hI43A', 'search', 'english'                             , 'http://www.example.com/search_result?q=english'                             , ''                                                                         , 343 )
  , ('2017-01-05 23:36:08', '1hI43A', 'search', 'history of english'                  , 'http://www.example.com/search_result?q=history+of+english'                  , ''                                                                         , 757 )
  , ('2017-01-05 23:36:39', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=9'                                         , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:38:10', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=137'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:39:17', '1hI43A', 'search', 'history of english origin'           , 'http://www.example.com/search_result?q=history+of+english+origin'           , ''                                                                         , 963 )
  , ('2017-01-05 23:40:04', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=158'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:40:52', '1hI43A', 'search', 'history of english england'          , 'http://www.example.com/search_result?q=history+of+english+england'          , ''                                                                         , 303 )
  , ('2017-01-06 23:34:36', '2bGs3i', 'search', 'nail'                                , 'http://www.example.com/search_result?q=nail'                                , ''                                                                         , 730 )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manikure'                            , 'http://www.example.com/search_result?q=manikure'                            , ''                                                                         , 0   )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manicure'                            , 'http://www.example.com/search_result?q=manicure'                            , ''                                                                         , 64  )
  , ('2017-01-06 23:36:33', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=123'                                       , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:01', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=11'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:52', '2bGs3i', 'search', 'manicure red'                        , 'http://www.example.com/search_result?q=manicure+red'                        , ''                                                                         , 827 )
  , ('2017-01-06 23:40:17', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=56'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:41:14', '2bGs3i', 'search', 'manicure dark red'                   , 'http://www.example.com/search_result?q=manicure+dark+red'                   , ''                                                                         , 920 )
  , ('2017-01-06 23:34:54', '2mmGwD', 'search', 'fab'                                 , 'http://www.example.com/search_result?q=fab'                                 , ''                                                                         , 646 )
  , ('2017-01-06 23:35:29', '2mmGwD', 'search', 'fabulous'                            , 'http://www.example.com/search_result?q=fabulous'                            , 'http://www.example.com/search_result?q=fab'                               , 179 )
  , ('2017-01-06 23:36:49', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=87'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:38:14', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=24'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:39:08', '2mmGwD', 'search', 'fabulous how to use'                 , 'http://www.example.com/search_result?q=fabulous+how+to+use'                 , ''                                                                         , 856 )
  , ('2017-01-06 23:40:05', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=51'                                        , 'http://www.example.com/search_result?q=fabulous+how+to+use'               , NULL)
  , ('2017-01-06 23:41:34', '2mmGwD', 'search', 'fabulous synonym'                    , 'http://www.example.com/search_result?q=fabulous+synonym'                    , ''                                                                         , 875 )
;
DROP TABLE IF EXISTS action_counts;
CREATE TABLE action_counts(
    user_id        varchar(255)
  , product        varchar(255)
  , view_count     integer
  , purchase_count integer
);

INSERT INTO action_counts
VALUES
    ('U001', 'D001',  2, 1)
  , ('U001', 'D002', 16, 0)
  , ('U001', 'D003', 14, 0)
  , ('U001', 'D004', 15, 0)
  , ('U001', 'D005', 21, 1)
  , ('U002', 'D001', 10, 1)
  , ('U002', 'D003', 28, 0)
  , ('U002', 'D005', 28, 1)
  , ('U003', 'D001', 49, 0)
  , ('U003', 'D004', 29, 1)
  , ('U003', 'D005', 24, 1)
;
DROP TABLE IF EXISTS exam_scores;
CREATE TABLE exam_scores(
    name    varchar(255)
  , subject varchar(255)
  , score   integer
);

INSERT INTO exam_scores
VALUES
    ('生徒A', '国語',  69)
  , ('生徒B', '国語',  87)
  , ('生徒C', '国語',  65)
  , ('生徒D', '国語',  73)
  , ('生徒E', '国語',  61)
  , ('生徒A', '数学', 100)
  , ('生徒B', '数学',  12)
  , ('生徒C', '数学',   7)
  , ('生徒D', '数学',  73)
  , ('生徒E', '数学',  56)
;
-- 必要なテーブルはありません
-- 必要なテーブルはありません
DROP TABLE IF EXISTS monthly_sales;
CREATE TABLE monthly_sales(
    year_month varchar(255)
  , item       varchar(255)
  , amount     integer
);

INSERT INTO monthly_sales
VALUES
   ('2016-01', 'D001', 30000)
 , ('2016-01', 'D002', 10000)
 , ('2016-01', 'D003',  5000)
 , ('2016-01', 'D004',  3000)
 , ('2016-02', 'D001', 30000)
 , ('2016-02', 'D002', 30000)
 , ('2016-02', 'D005', 20000)
 , ('2016-02', 'D003', 10000)
 , ('2016-03', 'D002', 40000)
 , ('2016-03', 'D005', 40000)
 , ('2016-03', 'D001', 20000)
 , ('2016-03', 'D003', 16000)
 , ('2016-10', 'D005', 50000)
 , ('2016-10', 'D004', 40000)
 , ('2016-10', 'D006', 30000)
 , ('2016-10', 'D003', 30000)
 , ('2016-11', 'D006', 60000)
 , ('2016-11', 'D004', 40000)
 , ('2016-11', 'D003', 40000)
 , ('2016-11', 'D001', 40000)
 , ('2016-12', 'D006', 70000)
 , ('2016-12', 'D003', 60000)
 , ('2016-12', 'D004', 50000)
 , ('2016-12', 'D001', 40000)
;
DROP TABLE IF EXISTS action_counts_with_date;
CREATE TABLE action_counts_with_date(
    dt      varchar(255)
  , user_id varchar(255)
  , product varchar(255)
  , v_count integer
  , p_count integer
);

INSERT INTO action_counts_with_date
VALUES
    ('2016-10-03', 'U001', 'D001',  1, 0)
  , ('2016-11-03', 'U001', 'D001',  1, 1)
  , ('2016-10-03', 'U001', 'D002', 16, 0)
  , ('2016-10-03', 'U001', 'D003', 14, 0)
  , ('2016-10-03', 'U001', 'D004', 15, 0)
  , ('2016-10-03', 'U001', 'D005', 19, 0)
  , ('2016-10-25', 'U001', 'D005',  1, 0)
  , ('2016-11-03', 'U001', 'D005',  1, 0)
  , ('2016-11-05', 'U001', 'D005',  0, 1)
  , ('2016-10-03', 'U002', 'D001', 10, 0)
  , ('2016-11-30', 'U002', 'D001',  0, 1)
  , ('2016-11-20', 'U002', 'D003', 28, 0)
  , ('2016-11-20', 'U002', 'D005', 28, 0)
  , ('2016-11-30', 'U002', 'D005',  0, 1)
  , ('2016-11-01', 'U003', 'D001', 49, 0)
  , ('2016-11-01', 'U003', 'D004', 29, 0)
  , ('2016-11-03', 'U003', 'D004',  0, 1)
  , ('2016-11-01', 'U003', 'D005', 24, 0)
  , ('2016-12-01', 'U003', 'D005',  0, 1)
;
DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log(
    stamp       varchar(255)
  , session     varchar(255)
  , purchase_id integer
  , product_id  varchar(255)
);

INSERT INTO purchase_detail_log
  VALUES
    ('2016-11-03 18:10', '989004ea',  1, 'D001')
  , ('2016-11-03 18:10', '989004ea',  1, 'D002')
  , ('2016-11-03 20:00', '47db0370',  2, 'D001')
  , ('2016-11-04 13:00', '1cf7678e',  3, 'D002')
  , ('2016-11-04 15:00', '5eb2e107',  4, 'A001')
  , ('2016-11-04 15:00', '5eb2e107',  4, 'A002')
  , ('2016-11-04 16:00', 'fe05e1d8',  5, 'A001')
  , ('2016-11-04 16:00', 'fe05e1d8',  5, 'A003')
  , ('2016-11-04 17:00', '87b5725f',  6, 'A001')
  , ('2016-11-04 17:00', '87b5725f',  6, 'A003')
  , ('2016-11-04 17:00', '87b5725f',  6, 'A004')
  , ('2016-11-04 18:00', '5d5b0997',  7, 'A005')
  , ('2016-11-04 18:00', '5d5b0997',  7, 'A006')
  , ('2016-11-04 19:00', '111f2996',  8, 'A002')
  , ('2016-11-04 19:00', '111f2996',  8, 'A003')
  , ('2016-11-04 20:00', '3efe001c',  9, 'A001')
  , ('2016-11-04 20:00', '3efe001c',  9, 'A003')
  , ('2016-11-04 21:00', '9afaf87c', 10, 'D001')
  , ('2016-11-04 21:00', '9afaf87c', 10, 'D003')
  , ('2016-11-04 22:00', 'd45ec190', 11, 'D001')
  , ('2016-11-04 22:00', 'd45ec190', 11, 'D002')
  , ('2016-11-04 23:00', '36dd0df7', 12, 'A002')
  , ('2016-11-04 23:00', '36dd0df7', 12, 'A003')
  , ('2016-11-04 23:00', '36dd0df7', 12, 'A004')
  , ('2016-11-05 15:00', 'cabf98e8', 13, 'A002')
  , ('2016-11-05 15:00', 'cabf98e8', 13, 'A004')
  , ('2016-11-05 16:00', 'f3b47933', 14, 'A005')
;
DROP TABLE IF EXISTS action_log;

CREATE TABLE action_log(
    stamp   varchar(255)
  , user_id varchar(255)
  , action  varchar(255)
  , product varchar(255)
);

INSERT INTO action_log
VALUES
    ('2016-11-03 18:00:00', 'U001', 'view'    , 'D001')
  , ('2016-11-03 18:01:00', 'U001', 'view'    , 'D002')
  , ('2016-11-03 18:02:00', 'U001', 'view'    , 'D003')
  , ('2016-11-03 18:03:00', 'U001', 'view'    , 'D004')
  , ('2016-11-03 18:04:00', 'U001', 'view'    , 'D005')
  , ('2016-11-03 18:05:00', 'U001', 'view'    , 'D001')
  , ('2016-11-03 18:06:00', 'U001', 'view'    , 'D005')
  , ('2016-11-03 18:10:00', 'U001', 'purchase', 'D001')
  , ('2016-11-03 18:10:00', 'U001', 'purchase', 'D005')
  , ('2016-11-03 19:00:00', 'U002', 'view'    , 'D001')
  , ('2016-11-03 19:01:00', 'U002', 'view'    , 'D003')
  , ('2016-11-03 19:02:00', 'U002', 'view'    , 'D005')
  , ('2016-11-03 19:03:00', 'U002', 'view'    , 'D003')
  , ('2016-11-03 19:04:00', 'U002', 'view'    , 'D005')
  , ('2016-11-03 19:10:00', 'U002', 'purchase', 'D001')
  , ('2016-11-03 19:10:00', 'U002', 'purchase', 'D005')
  , ('2016-11-03 20:00:00', 'U003', 'view'    , 'D001')
  , ('2016-11-03 20:01:00', 'U003', 'view'    , 'D004')
  , ('2016-11-03 20:02:00', 'U003', 'view'    , 'D005')
  , ('2016-11-03 20:10:00', 'U003', 'purchase', 'D004')
  , ('2016-11-03 20:10:00', 'U003', 'purchase', 'D005')
;
DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    stamp   varchar(255)
  , user_id varchar(255)
  , action  varchar(255)
  , product varchar(255)
);

INSERT INTO action_log
VALUES
    ('2016-11-03 18:00:00', 'U001', 'view'    , 'D001')
  , ('2016-11-03 18:01:00', 'U001', 'view'    , 'D002')
  , ('2016-11-03 18:02:00', 'U001', 'view'    , 'D003')
  , ('2016-11-03 18:03:00', 'U001', 'view'    , 'D004')
  , ('2016-11-03 18:04:00', 'U001', 'view'    , 'D005')
  , ('2016-11-03 18:05:00', 'U001', 'view'    , 'D001')
  , ('2016-11-03 18:06:00', 'U001', 'view'    , 'D005')
  , ('2016-11-03 18:10:00', 'U001', 'purchase', 'D001')
  , ('2016-11-03 18:10:00', 'U001', 'purchase', 'D005')
  , ('2016-11-03 19:00:00', 'U002', 'view'    , 'D001')
  , ('2016-11-03 19:01:00', 'U002', 'view'    , 'D003')
  , ('2016-11-03 19:02:00', 'U002', 'view'    , 'D005')
  , ('2016-11-03 19:03:00', 'U002', 'view'    , 'D003')
  , ('2016-11-03 19:04:00', 'U002', 'view'    , 'D005')
  , ('2016-11-03 19:10:00', 'U002', 'purchase', 'D001')
  , ('2016-11-03 19:10:00', 'U002', 'purchase', 'D005')
  , ('2016-11-03 20:00:00', 'U003', 'view'    , 'D001')
  , ('2016-11-03 20:01:00', 'U003', 'view'    , 'D004')
  , ('2016-11-03 20:02:00', 'U003', 'view'    , 'D005')
  , ('2016-11-03 20:10:00', 'U003', 'purchase', 'D004')
  , ('2016-11-03 20:10:00', 'U003', 'purchase', 'D005')
;
-- 必要なテーブルはありません
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp      timestamp
  , session    varchar(255)
  , action     varchar(255)
  , keyword    text
  , url        text
  , referrer   text
  , result_num integer
);

INSERT INTO access_log
VALUES
    ('2017-01-05 23:35:13', '0CVKaz', 'search', 'mynavi quest2'                       , 'http://www.example.com/search_result?q=mynavi+quest'                        , ''                                                                         ,   0 )
  , ('2017-01-05 23:36:08', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:37:17', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=170'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:38:38', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=133'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:40:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:41:43', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=64'                                        , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:43:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:34:57', '1QceiB', 'search', 'yamada taro'                         , 'http://www.example.com/search_result?q=yamada+taro'                         , ''                                                                         , 367 )
  , ('2017-01-05 23:35:37', '1QceiB', 'search', 'yamada taro football'                , 'http://www.example.com/search_result?q=yamada+taro+football'                , ''                                                                         , 105 )
  , ('2017-01-05 23:36:48', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=99'                                        , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:37:27', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=142'                                       , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:38:52', '1QceiB', 'search', 'yamada taro football transfers'      , 'http://www.example.com/search_result?q=yamada+taro+football+transfers'      , ''                                                                         ,  50 )
  , ('2017-01-05 23:39:50', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=7'                                         , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:41:23', '1QceiB', 'search', 'yamada taro football transfers where', 'http://www.example.com/search_result?q=yamada+taro+football+transfers+where', ''                                                                         ,   0 )
  , ('2017-01-05 23:34:39', '1hI43A', 'search', 'english'                             , 'http://www.example.com/search_result?q=english'                             , ''                                                                         , 343 )
  , ('2017-01-05 23:36:08', '1hI43A', 'search', 'history of english'                  , 'http://www.example.com/search_result?q=history+of+english'                  , ''                                                                         , 757 )
  , ('2017-01-05 23:36:39', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=9'                                         , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:38:10', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=137'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:39:17', '1hI43A', 'search', 'history of english origin'           , 'http://www.example.com/search_result?q=history+of+english+origin'           , ''                                                                         , 963 )
  , ('2017-01-05 23:40:04', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=158'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:40:52', '1hI43A', 'search', 'history of english england'          , 'http://www.example.com/search_result?q=history+of+english+england'          , ''                                                                         , 303 )
  , ('2017-01-06 23:34:36', '2bGs3i', 'search', 'nail'                                , 'http://www.example.com/search_result?q=nail'                                , ''                                                                         , 730 )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manikure'                            , 'http://www.example.com/search_result?q=manikure'                            , ''                                                                         , 0   )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manicure'                            , 'http://www.example.com/search_result?q=manicure'                            , ''                                                                         , 64  )
  , ('2017-01-06 23:36:33', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=123'                                       , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:01', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=11'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:52', '2bGs3i', 'search', 'manicure red'                        , 'http://www.example.com/search_result?q=manicure+red'                        , ''                                                                         , 827 )
  , ('2017-01-06 23:40:17', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=56'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:41:14', '2bGs3i', 'search', 'manicure dark red'                   , 'http://www.example.com/search_result?q=manicure+dark+red'                   , ''                                                                         , 920 )
  , ('2017-01-06 23:34:54', '2mmGwD', 'search', 'fab'                                 , 'http://www.example.com/search_result?q=fab'                                 , ''                                                                         , 646 )
  , ('2017-01-06 23:35:29', '2mmGwD', 'search', 'fabulous'                            , 'http://www.example.com/search_result?q=fabulous'                            , 'http://www.example.com/search_result?q=fab'                               , 179 )
  , ('2017-01-06 23:36:49', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=87'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:38:14', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=24'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:39:08', '2mmGwD', 'search', 'fabulous how to use'                 , 'http://www.example.com/search_result?q=fabulous+how+to+use'                 , ''                                                                         , 856 )
  , ('2017-01-06 23:40:05', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=51'                                        , 'http://www.example.com/search_result?q=fabulous+how+to+use'               , NULL)
  , ('2017-01-06 23:41:34', '2mmGwD', 'search', 'fabulous synonym'                    , 'http://www.example.com/search_result?q=fabulous+synonym'                    , ''                                                                         , 875 )
;
-- 必要なテーブルはありません
DROP TABLE IF EXISTS search_evaluation_by_col;
CREATE TABLE search_evaluation_by_col(
    path      varchar(255)
  , recall    numeric
  , precision numeric
);

INSERT INTO search_evaluation_by_col
VALUES
    ('/search1', 40.0, 60.0)
  , ('/search2', 60.0, 40.0)
  , ('/search3', 50.0, 50.0)
  , ('/search4', 30.0, 60.0)
  , ('/search5', 70.0,  0.0)
;

DROP TABLE IF EXISTS search_evaluation_by_row;
CREATE TABLE search_evaluation_by_row(
    path  varchar(255)
  , index varchar(255)
  , value numeric
);

INSERT INTO search_evaluation_by_row
VALUES
    ('/search1', 'recall'   , 40.0)
  , ('/search1', 'precision', 60.0)
  , ('/search2', 'recall'   , 60.0)
  , ('/search2', 'precision', 40.0)
  , ('/search3', 'recall'   , 50.0)
  , ('/search3', 'precision', 50.0)
  , ('/search4', 'recall'   , 30.0)
  , ('/search4', 'precision', 60.0)
  , ('/search5', 'recall'   , 70.0)
  , ('/search5', 'precision',  0.0)
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp      timestamp
  , session    varchar(255)
  , action     varchar(255)
  , keyword    text
  , url        text
  , referrer   text
  , result_num integer
);

INSERT INTO access_log
VALUES
    ('2017-01-05 23:35:13', '0CVKaz', 'search', 'mynavi quest2'                       , 'http://www.example.com/search_result?q=mynavi+quest'                        , ''                                                                         ,   0 )
  , ('2017-01-05 23:36:08', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:37:17', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=170'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:38:38', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=133'                                       , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:40:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:41:43', '0CVKaz', 'detail', ''                                    , 'http://www.example.com/detail?id=64'                                        , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data', NULL)
  , ('2017-01-05 23:43:10', '0CVKaz', 'search', 'mynavi quest the awakening of data'  , 'http://www.example.com/search_result?q=mynavi+quest+the+awakening+of+data'  , ''                                                                         , 630 )
  , ('2017-01-05 23:34:57', '1QceiB', 'search', 'yamada taro'                         , 'http://www.example.com/search_result?q=yamada+taro'                         , ''                                                                         , 367 )
  , ('2017-01-05 23:35:37', '1QceiB', 'search', 'yamada taro football'                , 'http://www.example.com/search_result?q=yamada+taro+football'                , ''                                                                         , 105 )
  , ('2017-01-05 23:36:48', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=99'                                        , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:37:27', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=142'                                       , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:38:52', '1QceiB', 'search', 'yamada taro football transfers'      , 'http://www.example.com/search_result?q=yamada+taro+football+transfers'      , ''                                                                         ,  50 )
  , ('2017-01-05 23:39:50', '1QceiB', 'detail', ''                                    , 'http://www.example.com/detail?id=7'                                         , 'http://www.example.com/search_result?q=yamada+taro+football'              , NULL)
  , ('2017-01-05 23:41:23', '1QceiB', 'search', 'yamada taro football transfers where', 'http://www.example.com/search_result?q=yamada+taro+football+transfers+where', ''                                                                         ,   0 )
  , ('2017-01-05 23:34:39', '1hI43A', 'search', 'english'                             , 'http://www.example.com/search_result?q=english'                             , ''                                                                         , 343 )
  , ('2017-01-05 23:36:08', '1hI43A', 'search', 'history of english'                  , 'http://www.example.com/search_result?q=history+of+english'                  , ''                                                                         , 757 )
  , ('2017-01-05 23:36:39', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=9'                                         , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:38:10', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=137'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:39:17', '1hI43A', 'search', 'history of english origin'           , 'http://www.example.com/search_result?q=history+of+english+origin'           , ''                                                                         , 963 )
  , ('2017-01-05 23:40:04', '1hI43A', 'detail', ''                                    , 'http://www.example.com/detail?id=158'                                       , 'http://www.example.com/search_result?q=history+of+english'                , NULL)
  , ('2017-01-05 23:40:52', '1hI43A', 'search', 'history of english england'          , 'http://www.example.com/search_result?q=history+of+english+england'          , ''                                                                         , 303 )
  , ('2017-01-06 23:34:36', '2bGs3i', 'search', 'nail'                                , 'http://www.example.com/search_result?q=nail'                                , ''                                                                         , 730 )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manikure'                            , 'http://www.example.com/search_result?q=manikure'                            , ''                                                                         , 0   )
  , ('2017-01-06 23:35:41', '2bGs3i', 'search', 'manicure'                            , 'http://www.example.com/search_result?q=manicure'                            , ''                                                                         , 64  )
  , ('2017-01-06 23:36:33', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=123'                                       , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:01', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=11'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:38:52', '2bGs3i', 'search', 'manicure red'                        , 'http://www.example.com/search_result?q=manicure+red'                        , ''                                                                         , 827 )
  , ('2017-01-06 23:40:17', '2bGs3i', 'detail', ''                                    , 'http://www.example.com/detail?id=56'                                        , 'http://www.example.com/search_result?q=manicure'                          , NULL)
  , ('2017-01-06 23:41:14', '2bGs3i', 'search', 'manicure dark red'                   , 'http://www.example.com/search_result?q=manicure+dark+red'                   , ''                                                                         , 920 )
  , ('2017-01-06 23:34:54', '2mmGwD', 'search', 'fab'                                 , 'http://www.example.com/search_result?q=fab'                                 , ''                                                                         , 646 )
  , ('2017-01-06 23:35:29', '2mmGwD', 'search', 'fabulous'                            , 'http://www.example.com/search_result?q=fabulous'                            , 'http://www.example.com/search_result?q=fab'                               , 179 )
  , ('2017-01-06 23:36:49', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=87'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:38:14', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=24'                                        , 'http://www.example.com/search_result?q=fabulous'                          , NULL)
  , ('2017-01-06 23:39:08', '2mmGwD', 'search', 'fabulous how to use'                 , 'http://www.example.com/search_result?q=fabulous+how+to+use'                 , ''                                                                         , 856 )
  , ('2017-01-06 23:40:05', '2mmGwD', 'detail', ''                                    , 'http://www.example.com/detail?id=51'                                        , 'http://www.example.com/search_result?q=fabulous+how+to+use'               , NULL)
  , ('2017-01-06 23:41:34', '2mmGwD', 'search', 'fabulous synonym'                    , 'http://www.example.com/search_result?q=fabulous+synonym'                    , ''                                                                         , 875 )
;
DROP TABLE IF EXISTS search_result;
CREATE TABLE search_result(
    keyword varchar(255)
  , rank    integer
  , item    varchar(255)
);

INSERT INTO search_result
VALUES
  ('sql'     ,  1, 'book001')
, ('sql'     ,  2, 'book005')
, ('sql'     ,  3, 'book012')
, ('sql'     ,  4, 'book004')
, ('sql'     ,  5, 'book003')
, ('sql'     ,  6, 'book010')
, ('sql'     ,  7, 'book024')
, ('sql'     ,  8, 'book025')
, ('sql'     ,  9, 'book050')
, ('sql'     , 10, 'book100')
, ('postgres',  1, 'book002')
, ('postgres',  2, 'book004')
, ('postgres',  3, 'book012')
, ('postgres',  4, 'book008')
, ('postgres',  5, 'book003')
, ('postgres',  6, 'book010')
, ('postgres',  7, 'book035')
, ('postgres',  8, 'book040')
, ('postgres',  9, 'book077')
, ('postgres', 10, 'book100')
, ('hive'    ,  1, 'book200')
;


DROP TABLE IF EXISTS correct_result;
CREATE TABLE correct_result(
    keyword varchar(255)
  , item    varchar(255)
);

INSERT INTO correct_result
VALUES
  ('sql'     , 'book003')
, ('sql'     , 'book005')
, ('sql'     , 'book008')
, ('sql'     , 'book010')
, ('sql'     , 'book025')
, ('sql'     , 'book100')
, ('postgres', 'book008')
, ('postgres', 'book010')
, ('postgres', 'book030')
, ('postgres', 'book055')
, ('postgres', 'book066')
, ('postgres', 'book100')
, ('hive'    , 'book200')
, ('redshift', 'book300')
;
DROP TABLE IF EXISTS search_result;
CREATE TABLE search_result(
    keyword varchar(255)
  , rank    integer
  , item    varchar(255)
);

INSERT INTO search_result
VALUES
    ('sql'     ,  1, 'book001')
  , ('sql'     ,  2, 'book005')
  , ('sql'     ,  3, 'book012')
  , ('sql'     ,  4, 'book004')
  , ('sql'     ,  5, 'book003')
  , ('sql'     ,  6, 'book010')
  , ('sql'     ,  7, 'book024')
  , ('sql'     ,  8, 'book025')
  , ('sql'     ,  9, 'book050')
  , ('sql'     , 10, 'book100')
  , ('postgres',  1, 'book002')
  , ('postgres',  2, 'book004')
  , ('postgres',  3, 'book012')
  , ('postgres',  4, 'book008')
  , ('postgres',  5, 'book003')
  , ('postgres',  6, 'book010')
  , ('postgres',  7, 'book035')
  , ('postgres',  8, 'book040')
  , ('postgres',  9, 'book077')
  , ('postgres', 10, 'book100')
  , ('hive'    ,  1, 'book200')
;

DROP TABLE IF EXISTS correct_result;
CREATE TABLE correct_result(
    keyword  varchar(255)
  , item  varchar(255)
);

INSERT INTO correct_result
VALUES
    ('sql'     , 'book003')
  , ('sql'     , 'book005')
  , ('sql'     , 'book008')
  , ('sql'     , 'book010')
  , ('sql'     , 'book025')
  , ('sql'     , 'book100')
  , ('postgres', 'book008')
  , ('postgres', 'book010')
  , ('postgres', 'book030')
  , ('postgres', 'book055')
  , ('postgres', 'book066')
  , ('postgres', 'book100')
  , ('hive'    , 'book200')
  , ('redshift', 'book300')
;
-- 必要なテーブルはありません
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp         varchar(255)
  , short_session varchar(255)
  , long_session  varchar(255)
  , url           text
  , referrer      text
);

INSERT INTO access_log
VALUES
    ('2016-10-01 12:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/?utm_source=google&utm_medium=search'       , 'http://www.google.co.jp/xxx'      )
  , ('2016-10-01 13:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/detail?id=1'                                , ''                                 )
  , ('2016-10-01 13:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/list/cd'                                    , ''                                 )
  , ('2016-10-01 14:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/detail?id=1'                                , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-01 15:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
  , ('2016-10-01 16:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/cd'                                    , 'http://www.example.com/list/newly')
  , ('2016-10-01 17:00:00', '2bGs3i', '1CwlSX', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-01 18:00:00', '2is8PX', '7Dn99b', 'http://www.example.com/detail?id=2'                                , 'https://twitter.com/xxx'          )
  , ('2016-10-02 12:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-02 13:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/list/cd'                                    , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-02 14:00:00', '3CEHe1', 'FGkTe9', 'http://www.example.com/list/dvd'                                   , ''                                 )
  , ('2016-10-02 15:00:00', '3Gv8vO', '1CwlSX', 'http://www.example.com/detail?id=2'                                , ''                                 )
  , ('2016-10-02 16:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/list/newly'                                 , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-02 17:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/'                                           , 'https://www.facebook.com/xxx'     )
  , ('2016-10-02 18:00:00', '690mvB', 'FGkTe9', 'http://www.example.com/list/dvd?utm_source=yahoo&utm_medium=search', 'http://www.yahoo.co.jp/xxx'       )
  , ('2016-10-03 12:00:00', '6oABhM', '3JMO2k', 'http://www.example.com/detail?id=3'                                , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-03 13:00:00', '7jjxQX', 'KKTw9P', 'http://www.example.com/?utm_source=mynavi&utm_medium=affiliate'    , 'http://www.mynavi.jp/xxx'         )
  , ('2016-10-03 14:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/dvd'                                   , 'https://www.facebook.com/xxx'     )
  , ('2016-10-03 15:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'page'  , '/input'       , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'page'  , '/confirm'     , ''                )
  , ('2017-01-09 12:23:00', '9afaf87c', 'view', 'page'  , '/complete'    , ''                )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list' , 'Area-L'          )
  , ('2017-01-09 12:18:44', '8cc03a54', 'view', 'page'  , '/input'       , 'Area-L'          )
  , ('2017-01-09 12:18:45', '8cc03a54', 'view', 'page'  , '/confirm'     , 'Area-L'          )
  , ('2017-01-09 12:18:46', '8cc03a54', 'view', 'page'  , '/complete'    , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input', ''                )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'page'  , '/input'       , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'page'  , '/confirm'     , ''                )
  , ('2017-01-09 12:23:00', '9afaf87c', 'view', 'page'  , '/complete'    , ''                )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list' , 'Area-L'          )
  , ('2017-01-09 12:18:44', '8cc03a54', 'view', 'page'  , '/input'       , 'Area-L'          )
  , ('2017-01-09 12:18:45', '8cc03a54', 'view', 'page'  , '/confirm'     , 'Area-L'          )
  , ('2017-01-09 12:18:46', '8cc03a54', 'view', 'page'  , '/complete'    , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input', ''                )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list/' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list/' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list/' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list/' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list/' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list/' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list/' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'search', '/search_list/' , 'Line-with-Job'   )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list/' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list/' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list/' , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input/', ''                )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , ''             , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'page'  , '/input'       , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'page'  , '/confirm'     , ''                )
  , ('2017-01-09 12:23:00', '9afaf87c', 'view', 'page'  , '/complete'    , ''                )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list' , 'Area-L'          )
  , ('2017-01-09 12:18:44', '8cc03a54', 'view', 'page'  , '/input'       , 'Area-L'          )
  , ('2017-01-09 12:18:45', '8cc03a54', 'view', 'page'  , '/confirm'     , 'Area-L'          )
  , ('2017-01-09 12:18:46', '8cc03a54', 'view', 'page'  , '/complete'    , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input', ''                )
;
DROP TABLE IF EXISTS form_log;
CREATE TABLE form_log(
    stamp    varchar(255)
  , session  varchar(255)
  , action   varchar(255)
  , path     varchar(255)
  , status   varchar(255)
);

INSERT INTO form_log
VALUES
    ('2016-12-30 00:56:08', '647219c7', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:56:08', '9b5f320f', 'view', '/cart/input'      , ''     )
  , ('2016-12-30 00:57:04', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:57:56', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:58:50', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 01:00:19', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:56:08', '8e9afadc', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '46b4c72c', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:57:31', '46b4c72c', 'view', '/regist/confirm'  , ''     )
  , ('2016-12-30 00:56:08', '539eb753', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '42532886', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', 'b2dbcc54', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:57:48', 'b2dbcc54', 'view', '/contact/confirm' , 'error')
  , ('2016-12-30 00:58:58', 'b2dbcc54', 'view', '/contact/confirm' , ''     )
  , ('2016-12-30 01:00:06', 'b2dbcc54', 'view', '/contact/complete', ''     )
;
DROP TABLE IF EXISTS read_log;
CREATE TABLE read_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , url          varchar(255)
);

INSERT INTO read_log
VALUES
    ('2016-12-29 21:45:47', 'afbd3d09', 'view'     , 'http://www.example.com/article?id=news341' )
  , ('2016-12-29 21:45:47', 'df6eb25d', 'view'     , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:45:56', 'df6eb25d', 'read-20%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:05', 'df6eb25d', 'read-40%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:13', 'df6eb25d', 'read-60%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:22', 'df6eb25d', 'read-80%' , 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:46:25', 'df6eb25d', 'read-100%', 'http://www.example.com/article?id=news731' )
  , ('2016-12-29 21:45:47', '77d477cc', 'view'     , 'http://www.example.com/article?id=it605'   )
  , ('2016-12-29 21:45:49', '77d477cc', 'read-20%' , 'http://www.example.com/article?id=it605'   )
  , ('2016-12-29 21:45:47', 'a80ded24', 'view'     , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:47', '76c67c39', 'view'     , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:54', '76c67c39', 'read-20%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:59', '76c67c39', 'read-40%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:46:08', '76c67c39', 'read-60%' , 'http://www.example.com/article?id=trend925')
  , ('2016-12-29 21:45:47', '08962ace', 'view'     , 'http://www.example.com/article?id=trend132')
;
-- 必要なテーブルはありません
DROP TABLE IF EXISTS form_error_log;
CREATE TABLE form_error_log(
    stamp       varchar(255)
  , session     varchar(255)
  , form        varchar(255)
  , field       varchar(255)
  , error_type  varchar(255)
  , value       varchar(255)
);

INSERT INTO form_error_log
VALUES
     ('2016-12-30 00:56:08', '004dc3ef', 'regist', 'email', 'require'     , ''            )
   , ('2016-12-30 00:56:08', '004dc3ef', 'regist', 'kana' , 'require'     , ''            )
   , ('2016-12-30 00:57:21', '004dc3ef', 'regist', 'zip'  , 'format_error', '101-'        )
   , ('2016-12-30 00:56:08', '00700be4', 'cart'  , 'email', 'format_error', 'xxx---.co.jp')
   , ('2016-12-30 00:56:09', '01061716', 'regist', 'email', 'format_error', 'xxx@---cojp' )
   , ('2016-12-30 00:56:42', '01061716', 'regist', 'kana' , 'not_kana'    , '山田 太郎'     )
   , ('2016-12-30 00:56:09', '02596e8a', 'regist', 'kana' , 'require'     , ''            )
   , ('2016-12-30 00:56:09', '035a1ebb', 'cart'  , 'tel'  , 'format_error', '03-99999999' )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'page'  , '/input'       , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'page'  , '/confirm'     , ''                )
  , ('2017-01-09 12:23:00', '9afaf87c', 'view', 'page'  , '/complete'    , ''                )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list' , 'Area-L'          )
  , ('2017-01-09 12:18:44', '8cc03a54', 'view', 'page'  , '/input'       , 'Area-L'          )
  , ('2017-01-09 12:18:45', '8cc03a54', 'view', 'page'  , '/confirm'     , 'Area-L'          )
  , ('2017-01-09 12:18:46', '8cc03a54', 'view', 'page'  , '/complete'    , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input', ''                )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , '/'            , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'page'  , '/input'       , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'page'  , '/confirm'     , ''                )
  , ('2017-01-09 12:23:00', '9afaf87c', 'view', 'page'  , '/complete'    , ''                )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list' , 'Area-L'          )
  , ('2017-01-09 12:18:44', '8cc03a54', 'view', 'page'  , '/input'       , 'Area-L'          )
  , ('2017-01-09 12:18:45', '8cc03a54', 'view', 'page'  , '/confirm'     , 'Area-L'          )
  , ('2017-01-09 12:18:46', '8cc03a54', 'view', 'page'  , '/complete'    , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input', ''                )
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp         varchar(255)
  , short_session varchar(255)
  , long_session  varchar(255)
  , url           text
  , referrer      text
);

INSERT INTO access_log
VALUES
    ('2016-10-01 12:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/?utm_source=google&utm_medium=search'       , 'http://www.google.co.jp/xxx'      )
  , ('2016-10-01 13:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/detail?id=1'                                , ''                                 )
  , ('2016-10-01 13:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/list/cd'                                    , ''                                 )
  , ('2016-10-01 14:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/detail?id=1'                                , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-01 15:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
  , ('2016-10-01 16:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/cd'                                    , 'http://www.example.com/list/newly')
  , ('2016-10-01 17:00:00', '2bGs3i', '1CwlSX', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-01 18:00:00', '2is8PX', '7Dn99b', 'http://www.example.com/detail?id=2'                                , 'https://twitter.com/xxx'          )
  , ('2016-10-02 12:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-02 13:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/list/cd'                                    , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-02 14:00:00', '3CEHe1', 'FGkTe9', 'http://www.example.com/list/dvd'                                   , ''                                 )
  , ('2016-10-02 15:00:00', '3Gv8vO', '1CwlSX', 'http://www.example.com/detail?id=2'                                , ''                                 )
  , ('2016-10-02 16:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/list/newly'                                 , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-02 17:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/'                                           , 'https://www.facebook.com/xxx'     )
  , ('2016-10-02 18:00:00', '690mvB', 'FGkTe9', 'http://www.example.com/list/dvd?utm_source=yahoo&utm_medium=search', 'http://www.yahoo.co.jp/xxx'       )
  , ('2016-10-03 12:00:00', '6oABhM', '3JMO2k', 'http://www.example.com/detail?id=3'                                , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-03 13:00:00', '7jjxQX', 'KKTw9P', 'http://www.example.com/?utm_source=mynavi&utm_medium=affiliate'    , 'http://www.mynavi.jp/xxx'         )
  , ('2016-10-03 14:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/dvd'                                   , 'https://www.facebook.com/xxx'     )
  , ('2016-10-03 15:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp         varchar(255)
  , short_session varchar(255)
  , long_session  varchar(255)
  , url           text
  , referrer      text
);

INSERT INTO access_log
VALUES
    ('2016-10-01 12:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/?utm_source=google&utm_medium=search'       , 'http://www.google.co.jp/xxx'      )
  , ('2016-10-01 13:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/detail?id=1'                                , ''                                 )
  , ('2016-10-01 13:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/list/cd'                                    , ''                                 )
  , ('2016-10-01 14:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/detail?id=1'                                , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-01 15:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
  , ('2016-10-01 16:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/cd'                                    , 'http://www.example.com/list/newly')
  , ('2016-10-01 17:00:00', '2bGs3i', '1CwlSX', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-01 18:00:00', '2is8PX', '7Dn99b', 'http://www.example.com/detail?id=2'                                , 'https://twitter.com/xxx'          )
  , ('2016-10-02 12:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-02 13:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/list/cd'                                    , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-02 14:00:00', '3CEHe1', 'FGkTe9', 'http://www.example.com/list/dvd'                                   , ''                                 )
  , ('2016-10-02 15:00:00', '3Gv8vO', '1CwlSX', 'http://www.example.com/detail?id=2'                                , ''                                 )
  , ('2016-10-02 16:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/list/newly'                                 , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-02 17:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/'                                           , 'https://www.facebook.com/xxx'     )
  , ('2016-10-02 18:00:00', '690mvB', 'FGkTe9', 'http://www.example.com/list/dvd?utm_source=yahoo&utm_medium=search', 'http://www.yahoo.co.jp/xxx'       )
  , ('2016-10-03 12:00:00', '6oABhM', '3JMO2k', 'http://www.example.com/detail?id=3'                                , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-03 13:00:00', '7jjxQX', 'KKTw9P', 'http://www.example.com/?utm_source=mynavi&utm_medium=affiliate'    , 'http://www.mynavi.jp/xxx'         )
  , ('2016-10-03 14:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/dvd'                                   , 'https://www.facebook.com/xxx'     )
  , ('2016-10-03 15:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
;

DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    stamp         varchar(255)
  , short_session varchar(255)
  , long_session  varchar(255)
  , purchase_id   integer
  , amount        integer
);

INSERT INTO purchase_log
VALUES
    ('2016-10-01 15:00:00', '0CVKaz', '1CwlSX', 1, 1000)
  , ('2016-10-01 16:00:00', '2is8PX', '7Dn99b', 2, 1000)
  , ('2016-10-01 20:00:00', '2is8PX', '7Dn99b', 3, 1000)
  , ('2016-10-02 14:00:00', '2is8PX', '7Dn99b', 4, 1000)
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp         varchar(255)
  , short_session varchar(255)
  , long_session  varchar(255)
  , url           text
  , referrer      text
);

INSERT INTO access_log
VALUES
    ('2016-10-01 12:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/?utm_source=google&utm_medium=search'       , 'http://www.google.co.jp/xxx'      )
  , ('2016-10-01 13:00:00', '0CVKaz', '1CwlSX', 'http://www.example.com/detail?id=1'                                , ''                                 )
  , ('2016-10-01 13:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/list/cd'                                    , ''                                 )
  , ('2016-10-01 14:00:00', '1QceiB', '3JMO2k', 'http://www.example.com/detail?id=1'                                , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-01 15:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
  , ('2016-10-01 16:00:00', '1hI43A', '6SN6DD', 'http://www.example.com/list/cd'                                    , 'http://www.example.com/list/newly')
  , ('2016-10-01 17:00:00', '2bGs3i', '1CwlSX', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-01 18:00:00', '2is8PX', '7Dn99b', 'http://www.example.com/detail?id=2'                                , 'https://twitter.com/xxx'          )
  , ('2016-10-02 12:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/'                                           , ''                                 )
  , ('2016-10-02 13:00:00', '2mmGwD', 'EFnoNR', 'http://www.example.com/list/cd'                                    , 'http://search.google.co.jp/xxx'   )
  , ('2016-10-02 14:00:00', '3CEHe1', 'FGkTe9', 'http://www.example.com/list/dvd'                                   , ''                                 )
  , ('2016-10-02 15:00:00', '3Gv8vO', '1CwlSX', 'http://www.example.com/detail?id=2'                                , ''                                 )
  , ('2016-10-02 16:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/list/newly'                                 , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-02 17:00:00', '3cv4gm', 'KBlKgT', 'http://www.example.com/'                                           , 'https://www.facebook.com/xxx'     )
  , ('2016-10-02 18:00:00', '690mvB', 'FGkTe9', 'http://www.example.com/list/dvd?utm_source=yahoo&utm_medium=search', 'http://www.yahoo.co.jp/xxx'       )
  , ('2016-10-03 12:00:00', '6oABhM', '3JMO2k', 'http://www.example.com/detail?id=3'                                , 'http://search.yahoo.co.jp/xxx'    )
  , ('2016-10-03 13:00:00', '7jjxQX', 'KKTw9P', 'http://www.example.com/?utm_source=mynavi&utm_medium=affiliate'    , 'http://www.mynavi.jp/xxx'         )
  , ('2016-10-03 14:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/dvd'                                   , 'https://www.facebook.com/xxx'     )
  , ('2016-10-03 15:00:00', 'AAuoEU', '6SN6DD', 'http://www.example.com/list/newly'                                 , ''                                 )
;DROP TABLE IF EXISTS form_log;
CREATE TABLE form_log(
    stamp    varchar(255)
  , session  varchar(255)
  , action   varchar(255)
  , path     varchar(255)
  , status   varchar(255)
);

INSERT INTO form_log
VALUES
    ('2016-12-30 00:56:08', '647219c7', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:56:08', '9b5f320f', 'view', '/cart/input'      , ''     )
  , ('2016-12-30 00:57:04', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:57:56', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:58:50', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 01:00:19', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:56:08', '8e9afadc', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '46b4c72c', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:57:31', '46b4c72c', 'view', '/regist/confirm'  , ''     )
  , ('2016-12-30 00:56:08', '539eb753', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '42532886', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', 'b2dbcc54', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:57:48', 'b2dbcc54', 'view', '/contact/confirm' , 'error')
  , ('2016-12-30 00:58:58', 'b2dbcc54', 'view', '/contact/confirm' , ''     )
  , ('2016-12-30 01:00:06', 'b2dbcc54', 'view', '/contact/complete', ''     )
;
DROP TABLE IF EXISTS form_log;
CREATE TABLE form_log(
    stamp    varchar(255)
  , session  varchar(255)
  , action   varchar(255)
  , path     varchar(255)
  , status   varchar(255)
);

INSERT INTO form_log
VALUES
    ('2016-12-30 00:56:08', '647219c7', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:56:08', '9b5f320f', 'view', '/cart/input'      , ''     )
  , ('2016-12-30 00:57:04', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:57:56', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:58:50', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 01:00:19', '9b5f320f', 'view', '/regist/confirm'  , 'error')
  , ('2016-12-30 00:56:08', '8e9afadc', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '46b4c72c', 'view', '/regist/input'    , ''     )
  , ('2016-12-30 00:57:31', '46b4c72c', 'view', '/regist/confirm'  , ''     )
  , ('2016-12-30 00:56:08', '539eb753', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', '42532886', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:56:08', 'b2dbcc54', 'view', '/contact/input'   , ''     )
  , ('2016-12-30 00:57:48', 'b2dbcc54', 'view', '/contact/confirm' , 'error')
  , ('2016-12-30 00:58:58', 'b2dbcc54', 'view', '/contact/confirm' , ''     )
  , ('2016-12-30 01:00:06', 'b2dbcc54', 'view', '/contact/complete', ''     )
;
DROP TABLE IF EXISTS activity_log;
CREATE TABLE activity_log(
    stamp        varchar(255)
  , session      varchar(255)
  , action       varchar(255)
  , option       varchar(255)
  , path         varchar(255)
  , search_type  varchar(255)
);

INSERT INTO activity_log
VALUES
    ('2017-01-09 12:18:43', '989004ea', 'view', 'search', '/search_list/' , 'Area-L-with-Job' )
  , ('2017-01-09 12:19:27', '989004ea', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:20:03', '989004ea', 'view', 'search', '/search_list/' , 'Pref'            )
  , ('2017-01-09 12:18:43', '47db0370', 'view', 'search', '/search_list/' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '1cf7678e', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:19:04', '1cf7678e', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:18:43', '5eb2e107', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', 'fe05e1d8', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '87b5725f', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:20:22', '87b5725f', 'view', 'search', '/search_list/' , 'Line'            )
  , ('2017-01-09 12:20:46', '87b5725f', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:21:26', '87b5725f', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:22:51', '87b5725f', 'view', 'search', '/search_list/' , 'Station-with-Job')
  , ('2017-01-09 12:24:13', '87b5725f', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:25:25', '87b5725f', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:18:43', 'eee2bb21', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '5d5b0997', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '111f2996', 'view', 'search', '/search_list/' , 'Pref'            )
  , ('2017-01-09 12:19:11', '111f2996', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:20:10', '111f2996', 'view', 'page'  , '/'             , ''                )
  , ('2017-01-09 12:21:14', '111f2996', 'view', 'page'  , '/search_input/', ''                )
  , ('2017-01-09 12:18:43', '3efe001c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '9afaf87c', 'view', 'search', '/search_list/' , ''                )
  , ('2017-01-09 12:20:18', '9afaf87c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:21:39', '9afaf87c', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:22:52', '9afaf87c', 'view', 'search', '/search_list/' , 'Line-with-Job'   )
  , ('2017-01-09 12:18:43', 'd45ec190', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '0fe39581', 'view', 'search', '/search_list/' , 'Area-S'          )
  , ('2017-01-09 12:18:43', '36dd0df7', 'view', 'search', '/search_list/' , 'Pref-with-Job'   )
  , ('2017-01-09 12:19:49', '36dd0df7', 'view', 'detail', '/detail/'      , ''                )
  , ('2017-01-09 12:18:43', '8cc03a54', 'view', 'search', '/search_list/' , 'Area-L'          )
  , ('2017-01-09 12:18:43', 'cabf98e8', 'view', 'page'  , '/search_input/', ''                )
;
DROP TABLE IF EXISTS action_log_with_ip;
CREATE TABLE action_log_with_ip(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , ip       varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log_with_ip
VALUES
    ('989004ea', 'U001', 'view', '216.58.220.238', '2016-11-03 18:00:00')
  , ('47db0370', 'U002', 'view', '98.139.183.24' , '2016-11-03 19:00:00')
  , ('1cf7678e', 'U003', 'view', '210.154.149.63', '2016-11-03 20:00:00')
  , ('5eb2e107', 'U004', 'view', '127.0.0.1'     , '2016-11-03 21:00:00')
  , ('fe05e1d8', 'U001', 'view', '216.58.220.238', '2016-11-04 18:00:00')
  , ('87b5725f', 'U005', 'view', '10.0.0.3'      , '2016-11-04 19:00:00')
  , ('5d5b0997', 'U006', 'view', '172.16.0.5'    , '2016-11-04 20:00:00')
  , ('111f2996', 'U007', 'view', '192.168.0.23'  , '2016-11-04 21:00:00')
  , ('3efe001c', 'U008', 'view', '192.0.0.10'    , '2016-11-04 22:00:00')
;
DROP TABLE IF EXISTS mst_products_20161201;
CREATE TABLE mst_products_20161201(
    product_id  varchar(255)
  , name        varchar(255)
  , price       integer
  , updated_at  varchar(255)
);

INSERT INTO mst_products_20161201
VALUES
    ('A001', 'AAA', 300, '2016-11-03 18:00:00')
  , ('A002', 'AAB', 400, '2016-11-03 19:00:00')
  , ('B001', 'BBB', 500, '2016-11-03 20:00:00')
  , ('B002', 'BBD', 300, '2016-11-03 21:00:00')
  , ('C001', 'CCA', 400, '2016-11-04 18:00:00')
  , ('D001', 'DAA', 500, '2016-11-04 19:00:00')
;

DROP TABLE IF EXISTS mst_products_20170101;
CREATE TABLE mst_products_20170101(
    product_id  varchar(255)
  , name        varchar(255)
  , price       integer
  , updated_at  varchar(255)
);

INSERT INTO mst_products_20170101
  VALUES
    ('A001', 'AAA', 300, '2016-11-03 18:00:00')
  , ('A002', 'AAB', 400, '2016-11-03 19:00:00')
  , ('B002', 'BBD', 300, '2016-11-03 21:00:00')
  , ('C001', 'CCA', 500, '2016-12-04 18:00:00')
  , ('D001', 'DAA', 500, '2016-11-04 19:00:00')
  , ('D002', 'DAD', 500, '2016-12-04 19:00:00')
;
DROP TABLE IF EXISTS action_log_with_ip;
CREATE TABLE action_log_with_ip(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , ip       varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log_with_ip
VALUES
    ('0CVKaz', 'U001', 'view', '216.58.220.238', '2016-11-03 18:00:00')
  , ('1QceiB', 'U002', 'view', '98.139.183.24' , '2016-11-03 19:00:00')
  , ('1hI43A', 'U003', 'view', '210.154.149.63', '2016-11-03 20:00:00')
;
DROP TABLE IF EXISTS invalid_action_log;
CREATE TABLE invalid_action_log(
    stamp     varchar(255)
  , session   varchar(255)
  , user_id   varchar(255)
  , action    varchar(255)
  , category  varchar(255)
  , products  varchar(255)
  , amount    integer
);

INSERT INTO invalid_action_log
VALUES
    ('2016-11-03 18:10:00', '0CVKaz', 'U001', 'purchase', 'drama' , 'D001,D002', 2000)
  , ('2016-11-03 18:00:00', '0CVKaz', 'U001', 'favorite', 'drama' , 'D001'     , NULL)
  , ('2016-11-03 18:00:00', '0CVKaz', 'U001', 'view'    , NULL    , NULL       , NULL)
  , ('2016-11-03 18:01:00', '0CVKaz', 'U001', 'add_cart', 'drama' , 'D002'     , NULL)
  , ('2016-11-03 18:02:00', '0CVKaz', 'U001', 'add_cart', 'drama' , NULL       , NULL)
  , ('2016-11-04 13:00:00', '1QceiB', 'U002', 'purchase', 'drama' , 'D002'     , 1000)
  , (NULL                 , '1QceiB', 'U002', 'purchase', 'action', 'A005,A006', 1000)
;
DROP TABLE IF EXISTS action_log_with_noise;
CREATE TABLE action_log_with_noise(
    stamp       varchar(255)
  , session     varchar(255)
  , action      varchar(255)
  , products    varchar(255)
  , url         text
  , ip          varchar(255)
  , user_agent  text
);

INSERT INTO action_log_with_noise
VALUES
    ('2016-11-03 18:00:00', '1b700', 'view'    , ''    , 'http://www.example.com/detail?id=1', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
  , ('2016-11-03 19:00:00', '1b700', 'add_cart', 'D001', 'http://www.example.com/detail?id=2', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
  , ('2016-11-03 19:00:00', '1b700', 'purchase', 'D001', 'http://www.example.com/detail?id=2', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
  , ('2016-11-03 20:00:00', '0fb22', 'view'    , ''    , 'http://www.example.com/detail?id=3', '210.154.149.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12' )
  , ('2016-11-03 21:00:00', '0fb22', 'view'    , ''    , 'http://www.example.com/detail?id=1', '210.154.149.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12' )
  , ('2016-11-04 18:00:00', 'fdb83', 'view'    , ''    , 'http://www.example.com/detail?id=2', '127.0.0.1'     , 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'       )
  , ('2016-11-04 19:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=3', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
  , ('2016-11-04 20:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=1', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
  , ('2016-11-04 20:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=1', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
  , ('2016-11-04 21:00:00', '14bec', 'view'    , ''    , 'http://www.example.com/detail?id=2', '10.0.0.3'      , 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0'                                               )
  , ('2016-11-04 22:00:00', '14bec', 'add_cart', ''    , 'http://www.example.com/detail?id=3', '10.0.0.3'      , 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0'                                               )
  , ('2016-11-04 22:00:00', '694dd', 'view'    , ''    , 'http://www.example.com/detail?id=1', '172.16.0.5'    , ''                                                                                                                        )
  , ('2016-11-04 22:00:00', '7af12', 'view'    , ''    , 'http://www.example.com/detail?id=2', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
  , ('2016-11-04 22:00:00', '7af12', 'add_cart', 'D002', 'http://www.example.com/detail?id=3', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
  , ('2016-11-04 22:00:00', '7af12', 'purchase', 'D002', 'http://www.example.com/detail?id=3', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', ''                                                                                                                        )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=4', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
  , ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
;
DROP TABLE IF EXISTS mst_categories;
CREATE TABLE mst_categories(
    id     integer
  , name   varchar(255)
  , stamp  varchar(255)
);

INSERT INTO mst_categories
VALUES
    (1, 'ladys_fashion', '2016-01-01 10:00:00')
  , (2, 'mens_fashion' , '2016-01-01 10:00:00')
  , (3, 'book'         , '2016-01-01 10:00:00')
  , (4, 'game'         , '2016-01-01 10:00:00')
  , (5, 'dvd'          , '2016-01-01 10:00:00')
  , (6, 'food'         , '2016-01-01 10:00:00')
  , (7, 'supplement'   , '2016-01-01 10:00:00')
  , (6, 'cooking'      , '2016-02-01 10:00:00')
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO access_log
VALUES
    ('98900e', 'U001', 'view', '2015-01-01 18:00:00')
  , ('98900e', 'U001', 'view', '2015-01-02 20:00:00')
  , ('98900e', 'U001', 'view', '2015-01-03 22:00:00')
  , ('1cf768', 'U002', 'view', '2015-01-04 23:00:00')
  , ('1cf768', 'U002', 'view', '2015-01-05 00:30:00')
  , ('1cf768', 'U002', 'view', '2015-01-06 02:30:00')
  , ('87b575', 'U001', 'view', '2015-01-07 03:30:00')
  , ('87b575', 'U001', 'view', '2015-01-08 04:00:00')
  , ('87b575', 'U001', 'view', '2015-01-09 12:00:00')
  , ('eee2b2', 'U002', 'view', '2015-01-10 13:00:00')
  , ('eee2b2', 'U001', 'view', '2015-01-11 15:00:00')
;
DROP TABLE IF EXISTS neighbor_pref;
CREATE TABLE neighbor_pref(
    pref_id             integer
  , pref_name           varchar(255)
  , neighbor_pref_id    integer
  , neighbor_pref_name  varchar(255)
);

INSERT INTO neighbor_pref
VALUES
    (1, '北海道', 2, '青森県')
  , (2, '青森県', 1, '北海道')
  , (2, '青森県', 3, '岩手県')
  , (2, '青森県', 5, '秋田県')
  , (3, '岩手県', 2, '青森県')
  , (3, '岩手県', 4, '宮城県')
  , (3, '岩手県', 5, '秋田県')
;

DROP TABLE IF EXISTS reservations;
CREATE TABLE reservations(
    rsv_id            integer
  , stamp             varchar(255)
  , member_id         integer
  , member_pref_id    integer
  , member_pref_name  varchar(255)
  , spot_id           integer
  , spot_pref_id      integer
  , spot_pref_name    varchar(255)
);

INSERT INTO reservations
VALUES
    (27414, '2016-12-31 07:36:48', 50063, 21, '岐阜県', 4454, 47, '沖縄県')
  , (27415, '2016-12-31 15:34:21', 43065, 19, '山梨県', 4899, 27, '大阪府')
  , (27416, '2016-12-31 16:05:10', 31038, 6 , '山形県', 7839, 15, '新潟県')
  , (27417, '2016-12-31 17:48:57', 53901, 34, '広島県', 1972, 4 , '宮城県')
  , (27418, '2016-12-31 23:24:33', 54998, 12, '千葉県', 2227, 3 , '岩手県')
  , (27419, '2017-01-01 02:43:20', 34078, 47, '沖縄県', 5522, 12, '千葉県')
  , (27420, '2017-01-01 05:06:10', 53307, 26, '京都府', 6559, 12, '千葉県')
  , (27421, '2017-01-01 08:37:36', 35423, 24, '三重県', 5500, 20, '長野県')
;
DROP TABLE IF EXISTS access_log;
CREATE TABLE access_log(
    stamp          varchar(255)
  , short_session  varchar(255)
  , long_session   varchar(255)
  , path           varchar(255)
);

INSERT INTO access_log
VALUES
    ('2016-10-01 12:00:00', '0CVKaz', '1CwlSX', '/detail')
  , ('2016-10-01 13:00:00', '0CVKaz', '1CwlSX', '/detail')
  , ('2016-10-01 13:00:00', '1QceiB', '3JMO2k', '/search')
  , ('2016-10-01 14:00:00', '1QceiB', '3JMO2k', '/detail')
  , ('2016-10-01 15:00:00', '1hI43A', '6SN6DD', '/search')
  , ('2016-10-01 16:00:00', '1hI43A', '6SN6DD', '/detail')
  , ('2016-10-01 17:00:00', '2bGs3i', '1CwlSX', '/top'   )
  , ('2016-10-01 18:00:00', '2is8PX', '7Dn99b', '/search')
  , ('2016-10-02 12:00:00', '2mmGwD', 'EFnoNR', '/top'   )
  , ('2016-10-02 13:00:00', '2mmGwD', 'EFnoNR', '/detail')
  , ('2016-10-02 14:00:00', '3CEHe1', 'FGkTe9', '/search')
  , ('2016-10-02 15:00:00', '3Gv8vO', '1CwlSX', '/detail')
  , ('2016-10-02 16:00:00', '3cv4gm', 'KBlKgT', '/top'   )
  , ('2016-10-02 17:00:00', '3cv4gm', 'KBlKgT', '/search')
  , ('2016-10-02 18:00:00', '690mvB', 'FGkTe9', '/top'   )
  , ('2016-10-03 12:00:00', '6oABhM', '3JMO2k', '/detail')
  , ('2016-10-03 13:00:00', '7jjxQX', 'KKTw9P', '/top'   )
  , ('2016-10-03 14:00:00', 'AAuoEU', '6SN6DD', '/top'   )
  , ('2016-10-03 15:00:00', 'AAuoEU', '6SN6DD', '/search')
;
DROP TABLE IF EXISTS dup_action_log;
CREATE TABLE dup_action_log(
    stamp     varchar(255)
  , session   varchar(255)
  , user_id   varchar(255)
  , action    varchar(255)
  , products  varchar(255)
);

INSERT INTO dup_action_log
VALUES
    ('2016-11-03 18:00:00', '989004ea', 'U001', 'click', 'D001')
  , ('2016-11-03 19:00:00', '47db0370', 'U002', 'click', 'D002')
  , ('2016-11-03 20:00:00', '1cf7678e', 'U003', 'click', 'A001')
  , ('2016-11-03 21:00:00', '5eb2e107', 'U004', 'click', 'A001')
  , ('2016-11-03 21:00:00', 'fe05e1d8', 'U004', 'click', 'D001')
  , ('2016-11-04 18:00:00', '87b5725f', 'U001', 'click', 'D001')
  , ('2016-11-04 19:00:00', 'eee2bb21', 'U005', 'click', 'A001')
  , ('2016-11-04 20:00:00', '5d5b0997', 'U006', 'click', 'D001')
  , ('2016-11-04 21:00:00', '111f2996', 'U007', 'click', 'D002')
  , ('2016-11-04 22:00:00', '3efe001c', 'U008', 'click', 'A001')
  , ('2016-11-04 22:00:10', '3efe001c', 'U008', 'click', 'A001')
;
DROP TABLE IF EXISTS action_log_with_noise;
CREATE TABLE action_log_with_noise(
    stamp       varchar(255)
  , session     varchar(255)
  , action      varchar(255)
  , products    varchar(255)
  , url         text
  , ip          varchar(255)
  , user_agent  text
);

INSERT INTO action_log_with_noise
VALUES
  ('2016-11-03 18:00:00', '1b700', 'view'    , ''    , 'http://www.example.com/detail?id=1', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
, ('2016-11-03 19:00:00', '1b700', 'add_cart', 'D001', 'http://www.example.com/detail?id=2', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
, ('2016-11-03 19:00:00', '1b700', 'purchase', 'D001', 'http://www.example.com/detail?id=2', '98.139.183.24' , 'Mozilla/5.0 (compatible; Bingbot/2.0; +http://www.bing.com/bingbot.htm)'                                                 )
, ('2016-11-03 20:00:00', '0fb22', 'view'    , ''    , 'http://www.example.com/detail?id=3', '210.154.149.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12' )
, ('2016-11-03 21:00:00', '0fb22', 'view'    , ''    , 'http://www.example.com/detail?id=1', '210.154.149.63', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_2) AppleWebKit/602.3.12 (KHTML, like Gecko) Version/10.0.2 Safari/602.3.12' )
, ('2016-11-04 18:00:00', 'fdb83', 'view'    , ''    , 'http://www.example.com/detail?id=2', '127.0.0.1'     , 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36'       )
, ('2016-11-04 19:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=3', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
, ('2016-11-04 20:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=1', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
, ('2016-11-04 20:00:00', 'fe8df', 'view'    , ''    , 'http://www.example.com/detail?id=1', '192.0.0.10'    , 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36'            )
, ('2016-11-04 21:00:00', '14bec', 'view'    , ''    , 'http://www.example.com/detail?id=2', '10.0.0.3'      , 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0'                                               )
, ('2016-11-04 22:00:00', '14bec', 'add_cart', ''    , 'http://www.example.com/detail?id=3', '10.0.0.3'      , 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:50.0) Gecko/20100101 Firefox/50.0'                                               )
, ('2016-11-04 22:00:00', '694dd', 'view'    , ''    , 'http://www.example.com/detail?id=1', '172.16.0.5'    , ''                                                                                                                        )
, ('2016-11-04 22:00:00', '7af12', 'view'    , ''    , 'http://www.example.com/detail?id=2', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
, ('2016-11-04 22:00:00', '7af12', 'add_cart', 'D002', 'http://www.example.com/detail?id=3', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
, ('2016-11-04 22:00:00', '7af12', 'purchase', 'D002', 'http://www.example.com/detail?id=3', '192.168.0.23'  , 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.98 Safari/537.36')
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', ''                                                                                                                        )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=1', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=4', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=2', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
, ('2016-11-04 22:00:00', 'c33fb', 'view'    , ''    , 'http://www.example.com/detail?id=3', '216.58.220.238', 'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)'                                                )
;
DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('98900e', 'U001', 'view', '2016-11-03 18:00:00')
  , ('98900e', 'U001', 'view', '2016-11-03 20:00:00')
  , ('98900e', 'U001', 'view', '2016-11-03 22:00:00')
  , ('1cf768', 'U002', 'view', '2016-11-03 23:00:00')
  , ('1cf768', 'U002', 'view', '2016-11-04 00:30:00')
  , ('1cf768', 'U002', 'view', '2016-11-04 02:30:00')
  , ('87b575', 'U001', 'view', '2016-11-04 03:30:00')
  , ('87b575', 'U001', 'view', '2016-11-04 04:00:00')
  , ('87b575', 'U001', 'view', '2016-11-04 12:00:00')
  , ('eee2b2', 'U002', 'view', '2016-11-04 13:00:00')
  , ('eee2b2', 'U001', 'view', '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    dt       varchar(255)
  , session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , products varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('2016-11-03', 'A', 'U001', 'add_cart', '1'    , '2016-11-03 18:00:00')
  , ('2016-11-03', 'A', 'U001', 'add_cart', '2'    , '2016-11-03 18:01:00')
  , ('2016-11-03', 'A', 'U001', 'add_cart', '3'    , '2016-11-03 18:02:00')
  , ('2016-11-03', 'A', 'U001', 'purchase', '1,2,3', '2016-11-03 18:10:00')
  , ('2016-11-03', 'B', 'U002', 'add_cart', '1'    , '2016-11-03 19:00:00')
  , ('2016-11-03', 'B', 'U002', 'purchase', '1'    , '2016-11-03 20:00:00')
  , ('2016-11-03', 'B', 'U002', 'add_cart', '2'    , '2016-11-03 20:30:00')
  , ('2016-11-04', 'C', 'U001', 'add_cart', '4'    , '2016-11-04 12:00:00')
  , ('2016-11-04', 'C', 'U001', 'add_cart', '5'    , '2016-11-04 12:00:00')
  , ('2016-11-04', 'C', 'U001', 'add_cart', '6'    , '2016-11-04 12:00:00')
  , ('2016-11-04', 'D', 'U002', 'purchase', '2'    , '2016-11-04 13:00:00')
  , ('2016-11-04', 'D', 'U001', 'purchase', '5,6'  , '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-10-01 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-10-01 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-01 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-10-01 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-01 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-10-01 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-10-01 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-10-01 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-10-01 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-12-01 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-12-01 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-18', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-18', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-20', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-25', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-11-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-11-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-11-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-11-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-11-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-11-03', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-11-03', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-11-03', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-11-04', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-11-05', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-11-05', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-11-10', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-11-10', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-11-15', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-11-28', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-11-28', 'sp' , NULL        )
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('536jdqk2', 'U001', 'view'   ,'2016-12-01 19:00:00')
  , ('1gs7jacx', 'U001', 'view'   ,'2017-01-01 19:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-25 15:00:00')
  , ('675bhjba', 'U002', 'view'   ,'2016-10-30 15:00:00')
  , ('fseg652d', 'U002', 'view'   ,'2016-11-01 15:00:00')
  , ('7a3jc52d', 'U002', 'view'   ,'2016-12-01 15:00:00')
  , ('ga43q56a', 'U003', 'view'   ,'2016-10-01 12:00:00')
  , ('854jcq5m', 'U004', 'view'   ,'2016-10-01 12:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-25 15:00:00')
  , ('675bhjba', 'U002', 'view'   ,'2016-10-30 15:00:00')
  , ('fseg652d', 'U002', 'view'   ,'2016-11-01 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-10 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
;
-- 必要なテーブルはありません
-- 必要なテーブルはありません
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('536jdqk2', 'U001', 'view'   ,'2016-12-01 19:00:00')
  , ('1gs7jacx', 'U001', 'view'   ,'2017-01-01 19:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-10 15:00:00')
  , ('ga43q56a', 'U003', 'view'   ,'2016-10-01 12:00:00')
  , ('854jcq5m', 'U004', 'view'   ,'2016-10-01 12:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-05', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-05', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-10', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-10', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-10', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-15', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-16', 'pc' , NULL        )
;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , category varchar(255)
  , products varchar(255)
  , amount   integer
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('989004ea', 'U001', 'view'    , NULL    , NULL       , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'favorite', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'review'  , 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 18:00:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 18:01:00')
  , ('989004ea', 'U001', 'add_cart', 'drama' , 'D001,D002', NULL, '2016-11-03 18:02:00')
  , ('989004ea', 'U001', 'purchase', 'drama' , 'D001,D002', 2000, '2016-11-03 18:10:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D001'     , NULL, '2016-11-03 19:00:00')
  , ('47db0370', 'U002', 'purchase', 'drama' , 'D001'     , 1000, '2016-11-03 20:00:00')
  , ('47db0370', 'U002', 'add_cart', 'drama' , 'D002'     , NULL, '2016-11-03 20:30:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A004'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A005'     , NULL, '2016-11-04 12:00:00')
  , ('87b5725f', 'U001', 'add_cart', 'action', 'A006'     , NULL, '2016-11-04 12:00:00')
  , ('9afaf87c', 'U002', 'purchase', 'drama' , 'D002'     , 1000, '2016-11-04 13:00:00')
  , ('9afaf87c', 'U001', 'purchase', 'action', 'A005,A006', 1000, '2016-11-04 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-10 15:00:00')
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , sex             varchar(255)
  , birth_date      varchar(255)
  , register_date   varchar(255)
  , register_device varchar(255)
  , withdraw_date   varchar(255)
);

INSERT INTO mst_users
VALUES
    ('U001', 'M', '1977-06-17', '2016-10-01', 'pc' , NULL        )
  , ('U002', 'F', '1953-06-12', '2016-10-01', 'sp' , '2016-10-10')
  , ('U003', 'M', '1965-01-06', '2016-10-01', 'pc' , NULL        )
  , ('U004', 'F', '1954-05-21', '2016-10-01', 'pc' , NULL        )
  , ('U005', 'M', '1987-11-23', '2016-10-01', 'sp' , NULL        )
  , ('U006', 'F', '1950-01-21', '2016-10-01', 'pc' , '2016-10-10')
  , ('U007', 'F', '1950-07-18', '2016-10-01', 'app', NULL        )
  , ('U008', 'F', '2006-12-09', '2016-10-01', 'sp' , NULL        )
  , ('U009', 'M', '2004-10-23', '2016-10-01', 'pc' , NULL        )
  , ('U010', 'F', '1987-03-18', '2016-10-01', 'pc' , NULL        )
  , ('U011', 'F', '1993-10-21', '2016-10-01', 'pc' , NULL        )
  , ('U012', 'M', '1993-12-22', '2016-10-01', 'app', NULL        )
  , ('U013', 'M', '1988-02-09', '2016-10-01', 'app', NULL        )
  , ('U014', 'F', '1994-04-07', '2016-10-01', 'sp' , NULL        )
  , ('U015', 'F', '1994-03-01', '2016-10-01', 'app', NULL        )
  , ('U016', 'F', '1991-09-02', '2016-10-01', 'pc' , NULL        )
  , ('U017', 'F', '1972-05-21', '2016-10-01', 'app', NULL        )
  , ('U018', 'M', '2009-10-12', '2016-10-01', 'app', NULL        )
  , ('U019', 'M', '1957-05-18', '2016-10-01', 'pc' , NULL        )
  , ('U020', 'F', '1954-04-17', '2016-10-02', 'app', NULL        )
  , ('U021', 'M', '2002-08-14', '2016-10-02', 'sp' , NULL        )
  , ('U022', 'M', '1979-12-09', '2016-10-02', 'app', NULL        )
  , ('U023', 'M', '1992-01-12', '2016-10-02', 'sp' , NULL        )
  , ('U024', 'F', '1962-10-16', '2016-10-02', 'app', NULL        )
  , ('U025', 'F', '1958-06-26', '2016-10-02', 'app', NULL        )
  , ('U026', 'M', '1969-02-21', '2016-10-02', 'sp' , NULL        )
  , ('U027', 'F', '2001-07-10', '2016-10-02', 'pc' , NULL        )
  , ('U028', 'M', '1976-05-26', '2016-10-02', 'app', NULL        )
  , ('U029', 'M', '1964-04-06', '2016-10-02', 'pc' , NULL        )
  , ('U030', 'M', '1959-10-07', '2016-10-02', 'sp' , NULL        )

;

DROP TABLE IF EXISTS action_log;
CREATE TABLE action_log(
    session  varchar(255)
  , user_id  varchar(255)
  , action   varchar(255)
  , stamp    varchar(255)
);

INSERT INTO action_log
VALUES
    ('989004ea', 'U001', 'view'   ,'2016-10-01 18:00:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:01:00')
  , ('989004ea', 'U001', 'view'   ,'2016-10-01 18:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 19:00:00')
  , ('47db0370', 'U001', 'view'   ,'2016-10-05 19:10:00')
  , ('47db0370', 'U001', 'follow' ,'2016-10-05 20:30:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 19:00:00')
  , ('5asfv583', 'U001', 'view'   ,'2016-10-20 19:10:00')
  , ('5asfv583', 'U001', 'follow' ,'2016-10-20 20:30:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:00:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:01:00')
  , ('87b5725f', 'U002', 'follow' ,'2016-10-01 12:02:00')
  , ('9afaf87c', 'U002', 'view'   ,'2016-10-02 13:00:00')
  , ('9afaf87c', 'U002', 'comment','2016-10-02 15:00:00')
  , ('afsd4bag', 'U002', 'view'   ,'2016-10-25 15:00:00')
  , ('675bhjba', 'U002', 'view'   ,'2016-10-30 15:00:00')
;
DROP TABLE IF EXISTS popular_products;
CREATE TABLE popular_products (
    product_id varchar(255)
  , category   varchar(255)
  , score      numeric
);

INSERT INTO popular_products
VALUES
    ('A001', 'action', 94)
  , ('A002', 'action', 81)
  , ('A003', 'action', 78)
  , ('A004', 'action', 64)
  , ('D001', 'drama' , 90)
  , ('D002', 'drama' , 82)
  , ('D003', 'drama' , 78)
  , ('D004', 'drama' , 58)
;
DROP TABLE IF EXISTS popular_products;
CREATE TABLE popular_products (
    product_id varchar(255)
  , category   varchar(255)
  , score      numeric
);

INSERT INTO popular_products
VALUES
    ('A001', 'action', 94)
  , ('A002', 'action', 81)
  , ('A003', 'action', 78)
  , ('A004', 'action', 64)
  , ('D001', 'drama' , 90)
  , ('D002', 'drama' , 82)
  , ('D003', 'drama' , 78)
  , ('D004', 'drama' , 58)
;
-- 必要なテーブルはありません
DROP TABLE IF EXISTS product_sales;
CREATE TABLE product_sales (
    category_name varchar(255)
  , product_id    varchar(255)
  , sales         integer
);

INSERT INTO product_sales
VALUES
    ('dvd' , 'D001', 50000)
  , ('dvd' , 'D002', 20000)
  , ('dvd' , 'D003', 10000)
  , ('cd'  , 'C001', 30000)
  , ('cd'  , 'C002', 20000)
  , ('cd'  , 'C003', 10000)
  , ('book', 'B001', 20000)
  , ('book', 'B002', 15000)
  , ('book', 'B003', 10000)
  , ('book', 'B004',  5000)
;
DROP TABLE IF EXISTS mst_user_location;
CREATE TABLE mst_user_location (
    user_id   varchar(255)
  , pref_name varchar(255)
  , city_name varchar(255)
);

INSERT INTO mst_user_location
VALUES
    ('U001', '東京都', '千代田区')
  , ('U002', '東京都', '渋谷区'  )
  , ('U003', '千葉県', '八千代区')
;
DROP TABLE IF EXISTS purchase_log_with_coupon;
CREATE TABLE purchase_log_with_coupon (
    purchase_id varchar(255)
  , amount      integer
  , coupon      integer
);

INSERT INTO purchase_log_with_coupon
VALUES
    ('10001', 3280, NULL)
  , ('10002', 4650,  500)
  , ('10003', 3870, NULL)
;

DROP TABLE IF EXISTS access_log ;
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

INSERT INTO access_log
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;
DROP TABLE IF EXISTS access_log ;
CREATE TABLE access_log (
    stamp    varchar(255)
  , referrer text
  , url      text
);

INSERT INTO access_log
VALUES
    ('2016-08-26 12:02:00', 'http://www.other.com/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video/detail?id=001')
  , ('2016-08-26 12:02:01', 'http://www.other.net/path1/index.php?k1=v1&k2=v2#Ref1', 'http://www.example.com/video#ref'          )
  , ('2016-08-26 12:02:01', 'https://www.other.com/'                               , 'http://www.example.com/book/detail?id=002' )
;
DROP TABLE IF EXISTS daily_kpi;
CREATE TABLE daily_kpi (
    dt        varchar(255)
  , indicator varchar(255)
  , val       integer
);

INSERT INTO daily_kpi
VALUES
    ('2017-01-01', 'impressions', 1800)
  , ('2017-01-01', 'sessions'   ,  500)
  , ('2017-01-01', 'users'      ,  200)
  , ('2017-01-02', 'impressions', 2000)
  , ('2017-01-02', 'sessions'   ,  700)
  , ('2017-01-02', 'users'      ,  250)
;

DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log (
    purchase_id integer
  , product_id  varchar(255)
  , price       integer
);

INSERT INTO purchase_detail_log
VALUES
    (100001, 'A001', 300)
  , (100001, 'A002', 400)
  , (100001, 'A003', 200)
  , (100002, 'D001', 500)
  , (100002, 'D002', 300)
  , (100003, 'A001', 300)
;
DROP TABLE IF EXISTS mst_categories;
CREATE TABLE mst_categories (
    category_id integer
  , name        varchar(255)
);

INSERT INTO mst_categories
VALUES
    (1, 'dvd' )
  , (2, 'cd'  )
  , (3, 'book')
;

DROP TABLE IF EXISTS category_sales;
CREATE TABLE category_sales (
    category_id integer
  , sales       integer
);

INSERT INTO category_sales
VALUES
    (1, 850000)
  , (2, 500000)
;

DROP TABLE IF EXISTS product_sale_ranking;
CREATE TABLE product_sale_ranking (
    category_id integer
  , rank        integer
  , product_id  varchar(255)
  , sales       integer
);

INSERT INTO product_sale_ranking
VALUES
    (1, 1, 'D001', 50000)
  , (1, 2, 'D002', 20000)
  , (1, 3, 'D003', 10000)
  , (2, 1, 'C001', 30000)
  , (2, 2, 'C002', 20000)
  , (2, 3, 'C003', 10000)
;
DROP TABLE IF EXISTS mst_users_with_card_number;
CREATE TABLE mst_users_with_card_number (
    user_id     varchar(255)
  , card_number varchar(255)
);

INSERT INTO mst_users_with_card_number
VALUES
    ('U001', '1234-xxxx-xxxx-xxxx')
  , ('U002', NULL                 )
  , ('U003', '5678-xxxx-xxxx-xxxx')
;

DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log (
    purchase_id integer
  , user_id     varchar(255)
  , amount      integer
  , stamp       varchar(255)
);

INSERT INTO purchase_log
VALUES
    (10001, 'U001', 200, '2017-01-30 10:00:00')
  , (10002, 'U001', 500, '2017-02-10 10:00:00')
  , (10003, 'U001', 200, '2017-02-12 10:00:00')
  , (10004, 'U002', 800, '2017-03-01 10:00:00')
  , (10005, 'U002', 400, '2017-03-02 10:00:00')
;

DROP TABLE IF EXISTS quarterly_sales;
CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

INSERT INTO quarterly_sales
VALUES
    (2015, 82000, 83000, 78000, 83000)
  , (2016, 85000, 85000, 80000, 81000)
  , (2017, 92000, 81000, NULL , NULL )
;
DROP TABLE IF EXISTS advertising_stats;
CREATE TABLE advertising_stats (
    dt          varchar(255)
  , ad_id       varchar(255)
  , impressions integer
  , clicks      integer
);

INSERT INTO advertising_stats
VALUES
    ('2017-04-01', '001', 100000,  3000)
  , ('2017-04-01', '002', 120000,  1200)
  , ('2017-04-01', '003', 500000, 10000)
  , ('2017-04-02', '001',      0,     0)
  , ('2017-04-02', '002', 130000,  1400)
  , ('2017-04-02', '003', 620000, 15000)
;
DROP TABLE IF EXISTS review;
CREATE TABLE review (
    user_id    varchar(255)
  , product_id varchar(255)
  , score      numeric
);

INSERT INTO review
VALUES
    ('U001', 'A001', 4.0)
  , ('U001', 'A002', 5.0)
  , ('U001', 'A003', 5.0)
  , ('U002', 'A001', 3.0)
  , ('U002', 'A002', 3.0)
  , ('U002', 'A003', 4.0)
  , ('U003', 'A001', 5.0)
  , ('U003', 'A002', 4.0)
  , ('U003', 'A003', 4.0)
;
DROP TABLE IF EXISTS app1_mst_users;
CREATE TABLE app1_mst_users (
    user_id varchar(255)
  , name    varchar(255)
  , email   varchar(255)
);

INSERT INTO app1_mst_users
VALUES
    ('U001', 'Sato'  , 'sato@example.com'  )
  , ('U002', 'Suzuki', 'suzuki@example.com')
;

DROP TABLE IF EXISTS app2_mst_users;
CREATE TABLE app2_mst_users (
    user_id varchar(255)
  , name    varchar(255)
  , phone   varchar(255)
);

INSERT INTO app2_mst_users
VALUES
    ('U001', 'Ito'   , '080-xxxx-xxxx')
  , ('U002', 'Tanaka', '070-xxxx-xxxx')
;
DROP TABLE IF EXISTS mst_users_with_birthday;
CREATE TABLE mst_users_with_birthday (
    user_id        varchar(255)
  , register_stamp varchar(255)
  , birth_date     varchar(255)
);

INSERT INTO mst_users_with_birthday
VALUES
    ('U001', '2016-02-28 10:00:00', '2000-02-29')
  , ('U002', '2016-02-29 10:00:00', '2000-02-29')
  , ('U003', '2016-03-01 10:00:00', '2000-02-29')
;
DROP TABLE IF EXISTS location_1d;
CREATE TABLE location_1d (
    x1 integer
  , x2 integer
);

INSERT INTO location_1d
VALUES
    ( 5 , 10)
  , (10 ,  5)
  , (-2 ,  4)
  , ( 3 ,  3)
  , ( 0 ,  1)
;

DROP TABLE IF EXISTS location_2d;
CREATE TABLE location_2d (
    x1 integer
  , y1 integer
  , x2 integer
  , y2 integer
);

INSERT INTO location_2d
VALUES
    (0, 0, 2, 2)
  , (3, 5, 1, 2)
  , (5, 3, 2, 1)
;
DROP TABLE IF EXISTS mst_users;
CREATE TABLE mst_users(
    user_id         varchar(255)
  , register_date   varchar(255)
  , register_device integer
);

INSERT INTO mst_users
VALUES
    ('U001', '2016-08-26', 1)
  , ('U002', '2016-08-26', 2)
  , ('U003', '2016-08-27', 3)
;
DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log(
    dt           varchar(255)
  , order_id     integer
  , user_id      varchar(255)
  , item_id      varchar(255)
  , price        integer
  , category     varchar(255)
  , sub_category varchar(255)
);

INSERT INTO purchase_detail_log
VALUES
    ('2015-12-01',   1, 'U001', 'D001', 200, 'ladys_fashion', 'bag'        )
  , ('2015-12-08',  95, 'U002', 'D002', 300, 'dvd'          , 'documentary')
  , ('2015-12-09', 168, 'U003', 'D003', 500, 'game'         , 'accessories')
  , ('2015-12-11', 250, 'U004', 'D004', 800, 'ladys_fashion', 'jacket'     )
  , ('2015-12-11', 325, 'U005', 'D005', 200, 'mens_fashion' , 'jacket'     )
  , ('2015-12-12', 400, 'U006', 'D006', 400, 'cd'           , 'classic'    )
  , ('2015-12-11', 475, 'U007', 'D007', 400, 'book'         , 'business'   )
  , ('2015-12-10', 550, 'U008', 'D008', 600, 'food'         , 'meats'      )
  , ('2015-12-10', 625, 'U009', 'D009', 600, 'food'         , 'fish'       )
  , ('2015-12-11', 700, 'U010', 'D010', 200, 'supplement'   , 'protain'    )
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',    1, 'rhwpvvitou', 13900)
  , ('2014-02-08',   95, 'chtanrqtzj', 28469)
  , ('2014-03-09',  168, 'bcqgtwxdgq', 18899)
  , ('2014-04-11',  250, 'kdjyplrxtk', 12394)
  , ('2014-05-11',  325, 'pgnjnnapsc',  2282)
  , ('2014-06-12',  400, 'iztgctnnlh', 10180)
  , ('2014-07-11',  475, 'eucjmxvjkj',  4027)
  , ('2014-08-10',  550, 'fqwvlvndef',  6243)
  , ('2014-09-10',  625, 'mhwhxfxrxq',  3832)
  , ('2014-10-11',  700, 'wyrgiyvaia',  6716)
  , ('2014-11-10',  775, 'cwpdvmhhwh', 16444)
  , ('2014-12-10',  850, 'eqeaqvixkf', 29199)
  , ('2015-01-09',  925, 'efmclayfnr', 22111)
  , ('2015-02-10', 1000, 'qnebafrkco', 11965)
  , ('2015-03-12', 1075, 'gsvqniykgx', 20215)
  , ('2015-04-12', 1150, 'ayzvjvnocm', 11792)
  , ('2015-05-13', 1225, 'knhevkibbp', 18087)
  , ('2015-06-10', 1291, 'wxhxmzqxuw', 18859)
  , ('2015-07-10', 1366, 'krrcpumtzb', 14919)
  , ('2015-08-08', 1441, 'lpglkecvsl', 12906)
  , ('2015-09-07', 1516, 'mgtlsfgfbj',  5696)
  , ('2015-10-07', 1591, 'trgjscaajt', 13398)
  , ('2015-11-06', 1666, 'ccfbjyeqrb',  6213)
  , ('2015-12-05', 1741, 'onooskbtzp', 26024)
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',    1, 'rhwpvvitou', 13900)
  , ('2014-02-08',   95, 'chtanrqtzj', 28469)
  , ('2014-03-09',  168, 'bcqgtwxdgq', 18899)
  , ('2014-04-11',  250, 'kdjyplrxtk', 12394)
  , ('2014-05-11',  325, 'pgnjnnapsc',  2282)
  , ('2014-06-12',  400, 'iztgctnnlh', 10180)
  , ('2014-07-11',  475, 'eucjmxvjkj',  4027)
  , ('2014-08-10',  550, 'fqwvlvndef',  6243)
  , ('2014-09-10',  625, 'mhwhxfxrxq',  3832)
  , ('2014-10-11',  700, 'wyrgiyvaia',  6716)
  , ('2014-11-10',  775, 'cwpdvmhhwh', 16444)
  , ('2014-12-10',  850, 'eqeaqvixkf', 29199)
  , ('2015-01-09',  925, 'efmclayfnr', 22111)
  , ('2015-02-10', 1000, 'qnebafrkco', 11965)
  , ('2015-03-12', 1075, 'gsvqniykgx', 20215)
  , ('2015-04-12', 1150, 'ayzvjvnocm', 11792)
  , ('2015-05-13', 1225, 'knhevkibbp', 18087)
  , ('2015-06-10', 1291, 'wxhxmzqxuw', 18859)
  , ('2015-07-10', 1366, 'krrcpumtzb', 14919)
  , ('2015-08-08', 1441, 'lpglkecvsl', 12906)
  , ('2015-09-07', 1516, 'mgtlsfgfbj',  5696)
  , ('2015-10-07', 1591, 'trgjscaajt', 13398)
  , ('2015-11-06', 1666, 'ccfbjyeqrb',  6213)
  , ('2015-12-05', 1741, 'onooskbtzp', 26024)
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',  1, 'rhwpvvitou', 13900)
  , ('2014-01-01',  2, 'hqnwoamzic', 10616)
  , ('2014-01-02',  3, 'tzlmqryunr', 21156)
  , ('2014-01-02',  4, 'wkmqqwbyai', 14893)
  , ('2014-01-03',  5, 'ciecbedwbq', 13054)
  , ('2014-01-03',  6, 'svgnbqsagx', 24384)
  , ('2014-01-03',  7, 'dfgqftdocu', 15591)
  , ('2014-01-04',  8, 'sbgqlzkvyn',  3025)
  , ('2014-01-04',  9, 'lbedmngbol', 24215)
  , ('2014-01-04', 10, 'itlvssbsgx',  2059)
  , ('2014-01-05', 11, 'jqcmmguhik',  4235)
  , ('2014-01-05', 12, 'jgotcrfeyn', 28013)
  , ('2014-01-05', 13, 'pgeojzoshx', 16008)
  , ('2014-01-06', 14, 'msjberhxnx',  1980)
  , ('2014-01-06', 15, 'tlhbolohte', 23494)
  , ('2014-01-06', 16, 'gbchhkcotf',  3966)
  , ('2014-01-07', 17, 'zfmbpvpzvu', 28159)
  , ('2014-01-07', 18, 'yauwzpaxtx',  8715)
  , ('2014-01-07', 19, 'uyqboqfgex', 10805)
  , ('2014-01-08', 20, 'hiqdkrzcpq',  3462)
  , ('2014-01-08', 21, 'zosbvlylpv', 13999)
  , ('2014-01-08', 22, 'bwfbchzgnl',  2299)
  , ('2014-01-09', 23, 'zzgauelgrt', 16475)
  , ('2014-01-09', 24, 'qrzfcwecge',  6469)
  , ('2014-01-10', 25, 'njbpsrvvcq', 16584)
  , ('2014-01-10', 26, 'cyxfgumkst', 11339)
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',  1, 'rhwpvvitou', 13900)
  , ('2014-01-01',  2, 'hqnwoamzic', 10616)
  , ('2014-01-02',  3, 'tzlmqryunr', 21156)
  , ('2014-01-02',  4, 'wkmqqwbyai', 14893)
  , ('2014-01-03',  5, 'ciecbedwbq', 13054)
  , ('2014-01-03',  6, 'svgnbqsagx', 24384)
  , ('2014-01-03',  7, 'dfgqftdocu', 15591)
  , ('2014-01-04',  8, 'sbgqlzkvyn',  3025)
  , ('2014-01-04',  9, 'lbedmngbol', 24215)
  , ('2014-01-04', 10, 'itlvssbsgx',  2059)
  , ('2014-01-05', 11, 'jqcmmguhik',  4235)
  , ('2014-01-05', 12, 'jgotcrfeyn', 28013)
  , ('2014-01-05', 13, 'pgeojzoshx', 16008)
  , ('2014-01-06', 14, 'msjberhxnx',  1980)
  , ('2014-01-06', 15, 'tlhbolohte', 23494)
  , ('2014-01-06', 16, 'gbchhkcotf',  3966)
  , ('2014-01-07', 17, 'zfmbpvpzvu', 28159)
  , ('2014-01-07', 18, 'yauwzpaxtx',  8715)
  , ('2014-01-07', 19, 'uyqboqfgex', 10805)
  , ('2014-01-08', 20, 'hiqdkrzcpq',  3462)
  , ('2014-01-08', 21, 'zosbvlylpv', 13999)
  , ('2014-01-08', 22, 'bwfbchzgnl',  2299)
  , ('2014-01-09', 23, 'zzgauelgrt', 16475)
  , ('2014-01-09', 24, 'qrzfcwecge',  6469)
  , ('2014-01-10', 25, 'njbpsrvvcq', 16584)
  , ('2014-01-10', 26, 'cyxfgumkst', 11339)
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',    1, 'rhwpvvitou', 13900)
  , ('2014-02-08',   95, 'chtanrqtzj', 28469)
  , ('2014-03-09',  168, 'bcqgtwxdgq', 18899)
  , ('2014-04-11',  250, 'kdjyplrxtk', 12394)
  , ('2014-05-11',  325, 'pgnjnnapsc',  2282)
  , ('2014-06-12',  400, 'iztgctnnlh', 10180)
  , ('2014-07-11',  475, 'eucjmxvjkj',  4027)
  , ('2014-08-10',  550, 'fqwvlvndef',  6243)
  , ('2014-09-10',  625, 'mhwhxfxrxq',  3832)
  , ('2014-10-11',  700, 'wyrgiyvaia',  6716)
  , ('2014-11-10',  775, 'cwpdvmhhwh', 16444)
  , ('2014-12-10',  850, 'eqeaqvixkf', 29199)
  , ('2015-01-09',  925, 'efmclayfnr', 22111)
  , ('2015-02-10', 1000, 'qnebafrkco', 11965)
  , ('2015-03-12', 1075, 'gsvqniykgx', 20215)
  , ('2015-04-12', 1150, 'ayzvjvnocm', 11792)
  , ('2015-05-13', 1225, 'knhevkibbp', 18087)
  , ('2015-06-10', 1291, 'wxhxmzqxuw', 18859)
  , ('2015-07-10', 1366, 'krrcpumtzb', 14919)
  , ('2015-08-08', 1441, 'lpglkecvsl', 12906)
  , ('2015-09-07', 1516, 'mgtlsfgfbj',  5696)
  , ('2015-10-07', 1591, 'trgjscaajt', 13398)
  , ('2015-11-06', 1666, 'ccfbjyeqrb',  6213)
  , ('2015-12-05', 1741, 'onooskbtzp', 26024)
;
DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log(
    dt           varchar(255)
  , order_id     integer
  , user_id      varchar(255)
  , item_id      varchar(255)
  , price        integer
  , category     varchar(255)
  , sub_category varchar(255)
);

INSERT INTO purchase_detail_log
VALUES
    ('2015-12-01',   1, 'U001', 'D001', 200, 'ladys_fashion', 'bag'        )
  , ('2015-12-08',  95, 'U002', 'D002', 300, 'dvd'          , 'documentary')
  , ('2015-12-09', 168, 'U003', 'D003', 500, 'game'         , 'accessories')
  , ('2015-12-11', 250, 'U004', 'D004', 800, 'ladys_fashion', 'jacket'     )
  , ('2015-12-11', 325, 'U005', 'D005', 200, 'mens_fashion' , 'jacket'     )
  , ('2015-12-12', 400, 'U006', 'D006', 400, 'cd'           , 'classic'    )
  , ('2015-12-11', 475, 'U007', 'D007', 400, 'book'         , 'business'   )
  , ('2015-12-10', 550, 'U008', 'D008', 600, 'food'         , 'meats'      )
  , ('2015-12-10', 625, 'U009', 'D009', 600, 'food'         , 'fish'       )
  , ('2015-12-11', 700, 'U010', 'D010', 200, 'supplement'   , 'protain'    )
;
DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log(
    dt           varchar(255)
  , order_id     integer
  , user_id      varchar(255)
  , item_id      varchar(255)
  , price        integer
  , category     varchar(255)
  , sub_category varchar(255)
);

INSERT INTO purchase_detail_log
VALUES
    ('2015-12-01',   1, 'U001', 'D001', 200, 'ladys_fashion', 'bag'        )
  , ('2015-12-08',  95, 'U002', 'D002', 300, 'dvd'          , 'documentary')
  , ('2015-12-09', 168, 'U003', 'D003', 500, 'game'         , 'accessories')
  , ('2015-12-11', 250, 'U004', 'D004', 800, 'ladys_fashion', 'jacket'     )
  , ('2015-12-11', 325, 'U005', 'D005', 200, 'mens_fashion' , 'jacket'     )
  , ('2015-12-12', 400, 'U006', 'D006', 400, 'cd'           , 'classic'    )
  , ('2015-12-11', 475, 'U007', 'D007', 400, 'book'         , 'business'   )
  , ('2015-12-10', 550, 'U008', 'D008', 600, 'food'         , 'meats'      )
  , ('2015-12-10', 625, 'U009', 'D009', 600, 'food'         , 'fish'       )
  , ('2015-12-11', 700, 'U010', 'D010', 200, 'supplement'   , 'protain'    )
;
DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log(
    dt           varchar(255)
  , order_id     integer
  , user_id      varchar(255)
  , item_id      varchar(255)
  , price        integer
  , category     varchar(255)
  , sub_category varchar(255)
);

INSERT INTO purchase_detail_log
VALUES
    ('2015-12-01',   1, 'U001', 'D001', 200, 'ladys_fashion', 'bag'        )
  , ('2015-12-08',  95, 'U002', 'D002', 300, 'dvd'          , 'documentary')
  , ('2015-12-09', 168, 'U003', 'D003', 500, 'game'         , 'accessories')
  , ('2015-12-11', 250, 'U004', 'D004', 800, 'ladys_fashion', 'jacket'     )
  , ('2015-12-11', 325, 'U005', 'D005', 200, 'mens_fashion' , 'jacket'     )
  , ('2015-12-12', 400, 'U006', 'D006', 400, 'cd'           , 'classic'    )
  , ('2015-12-11', 475, 'U007', 'D007', 400, 'book'         , 'business'   )
  , ('2015-12-10', 550, 'U008', 'D008', 600, 'food'         , 'meats'      )
  , ('2015-12-10', 625, 'U009', 'D009', 600, 'food'         , 'fish'       )
  , ('2015-12-11', 700, 'U010', 'D010', 200, 'supplement'   , 'protain'    )
;
DROP TABLE IF EXISTS purchase_log;
CREATE TABLE purchase_log(
    dt              varchar(255)
  , order_id        integer
  , user_id         varchar(255)
  , purchase_amount integer
);

INSERT INTO purchase_log
VALUES
    ('2014-01-01',  1, 'rhwpvvitou', 13900)
  , ('2014-01-01',  2, 'hqnwoamzic', 10616)
  , ('2014-01-02',  3, 'tzlmqryunr', 21156)
  , ('2014-01-02',  4, 'wkmqqwbyai', 14893)
  , ('2014-01-03',  5, 'ciecbedwbq', 13054)
  , ('2014-01-03',  6, 'svgnbqsagx', 24384)
  , ('2014-01-03',  7, 'dfgqftdocu', 15591)
  , ('2014-01-04',  8, 'sbgqlzkvyn',  3025)
  , ('2014-01-04',  9, 'lbedmngbol', 24215)
  , ('2014-01-04', 10, 'itlvssbsgx',  2059)
  , ('2014-01-05', 11, 'jqcmmguhik',  4235)
  , ('2014-01-05', 12, 'jgotcrfeyn', 28013)
  , ('2014-01-05', 13, 'pgeojzoshx', 16008)
  , ('2014-01-06', 14, 'msjberhxnx',  1980)
  , ('2014-01-06', 15, 'tlhbolohte', 23494)
  , ('2014-01-06', 16, 'gbchhkcotf',  3966)
  , ('2014-01-07', 17, 'zfmbpvpzvu', 28159)
  , ('2014-01-07', 18, 'yauwzpaxtx',  8715)
  , ('2014-01-07', 19, 'uyqboqfgex', 10805)
  , ('2014-01-08', 20, 'hiqdkrzcpq',  3462)
  , ('2014-01-08', 21, 'zosbvlylpv', 13999)
  , ('2014-01-08', 22, 'bwfbchzgnl',  2299)
  , ('2014-01-09', 23, 'zzgauelgrt', 16475)
  , ('2014-01-09', 24, 'qrzfcwecge',  6469)
  , ('2014-01-10', 25, 'njbpsrvvcq', 16584)
  , ('2014-01-10', 26, 'cyxfgumkst', 11339)
;
