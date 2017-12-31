点击流日志分析
平台：hadoop、hive、mysql、echarts
语言：java

分析指标：
# dw_pvs_hour 计算每个小时的pv（一台电脑为一个uv，一次页面访问为一个pv）
# dw_pvs_day 计算每天的pv
# dw_avgpv_user_d 每天人均浏览页数---所有页面valid+unvalid
# dw_avgpv_user_h 每小时人均浏览页数---所有页面valid+unvalid
# dw_pvs_referer_h 以小时为维度，统计每小时每个refer_url的pvs
# dw_ref_host_visit_cnts_h 以小时为维度，统计每小时每个域名ref_host的pvs
# dw_pvs_refhost_topn_h  计算每小时top3的ref_host
# dw_pvs_d 计算每天受访页面request的top10资源
# dw_user_dstc_ip_h 计算每个小时每个访客产生的pvCnts
# dw_dstc_ip_h 计算每小时产生的独立访客总数
# dw_user_dstc_ip_month_top10  统计这两天的访问次数topn的访客
# dw_user_dsct_history 每日新访客，创建一个去重访客累积表，然后将每日访客对比累积表
# dw_user_returning 回头访客 在visit表中出现在两个session中的remote_addr
# dw_user_avg_session 人均访问频次---有效页面valid
# 关键路径转化率分析——漏斗模型  substr从1开始为第一个字符substr(pos,length)

部分指标无法展示，部分数据通过python生成