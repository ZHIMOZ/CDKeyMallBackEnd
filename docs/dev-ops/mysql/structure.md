

**t_game_info 游戏信息表**

| 字段名      | 类型     | 必填 | 约束       | 备注            |
| ----------- | -------- | ---- | ---------- | --------------- |
| id          | bigint   | 是   | 主键，自增 |                 |
| name        | varchar  | 是   |            | 游戏名          |
| genre       | varchar  | 是   |            | 游戏类别        |
| cover       | varchar  | 是   |            | 游戏封面（URL） |
| summary     | varchar  | 是   |            | 游戏简述        |
| vali_flag   | tinyint  | 是   |            | 上架状态        |
| create_time | dateTime | 是   |            | 创建时间        |
| update_time | dateTime | 是   |            | 更新时间        |

default current_timestamp
on update current_timestamp

**t_sku 库存表**

| 字段名         | 类型          | 必填 | 约束       | 备注                      |
| -------------- | ------------- | ---- | ---------- | ------------------------- |
| id             | bigint        |      | 主键，自增 |                           |
| game_id        | varchar       | 是   | 外键       | 游戏id                    |
| platform       | varchar       | 是   |            | 平台（Steam/Epic）        |
| version        | varchar       | 是   |            | 版本（普通版/豪华版/DLC） |
| stock          | int           | 是   |            | 剩余数量                  |
| original_price | decimal(10,2) | 是   |            | 原价                      |
| create_time    | dateTime      | 是   |            | 创建时间                  |
| update_time    | dateTime      | 是   |            | 更新时间                  |

unique(game_id,platform,version)

**t_discount 折扣表**

| 字段名         | 类型          | 必填 | 约束       | 备注                       |
| -------------- | ------------- | ---- | ---------- | -------------------------- |
| id             | bigint        |      | 主键，自增 |                            |
| game_id        | varchar       | 是   | 外键       | 游戏id                     |
| discount_type  | tinyint       | 是   |            | 折扣类型(0直减，1百分比减) |
| discount_value | decimal(10,2) | 是   |            | 折扣数                     |
| create_time    | dateTime      | 是   |            | 创建时间                   |
| update_time    | dateTime      | 是   |            | 更新时间                   |

default current_timestamp
on update current_timestamp

**t_cdkey cdkey表**

| 字段名              | 类型     | 必填 | 约束       | 备注                              |
| ------------------- | -------- | ---- | ---------- | --------------------------------- |
| id                  | bigint   |      | 主键，自增 |                                   |
| game_id             | varchar  | 是   | 外键       | 游戏id                            |
| cdkey               | varchar  | 是   | 唯一       | cdkey                             |
| vali_flag           | tinyint  | 是   |            | 有效标志（0无效，1有效，2已冻结） |
| activation_platform | varchar  | 是   |            | 激活平台（Steam/Epic）            |
| region              | varchar  | 是   |            | 地区                              |
| create_time         | dateTime | 是   |            | 创建时间                          |
| update_time         | dateTime | 是   |            | 更新时间                          |

default current_timestamp
on update current_timestamp

**t_game_tag 标签表**

| 字段名      | 类型     | 必填 | 约束       | 备注     |
| ----------- | -------- | ---- | ---------- | -------- |
| id          | bigint   |      | 主键，自增 |          |
| tag         | varchar  | 是   |            | 标签     |
| game_id     | varchar  | 是   | 外键       | 游戏id   |
| create_time | dateTime | 是   |            | 创建时间 |
| update_time | dateTime | 是   |            | 更新时间 |

default current_timestamp
on update current_timestamp