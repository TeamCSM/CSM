package com.csm.admin.persistence;

import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.UserLogVO;

public interface StatisticsDAO {
	public StatisticsVO sellStatistics() throws Exception;
	
	public StatisticsVO priceStatistics() throws Exception;
	
	public MonthStatisticsVO contrastPriceStatistics() throws Exception;
	
	public MonthStatisticsVO contrastSellStatistics() throws Exception;
	
	public StatisticsVO connectionStatistics() throws Exception;
	
	public MonthStatisticsVO contrastConnStatistics() throws Exception;
	
	public StatisticsVO createStatistics() throws Exception;
	
	public MonthStatisticsVO contrastCreateStatistics() throws Exception;
	
	public StatisticsVO deleteStatistics() throws Exception;
	
	public MonthStatisticsVO contrastDeleteStatistics() throws Exception;
	
	public StatisticsVO resumeStatistics() throws Exception;
	
	public MonthStatisticsVO contrastResumeStatistics() throws Exception;
	
	public UserLogVO joinCount() throws Exception;
	
	public SellItemLogVO dailySum() throws Exception;
	
	public UserLogVO dailyCount() throws Exception;
	
	public UserLogVO dailyResume() throws Exception;
}
