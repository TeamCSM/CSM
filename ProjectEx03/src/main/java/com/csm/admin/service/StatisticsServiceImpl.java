package com.csm.admin.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.csm.admin.persistence.StatisticsDAO;
import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.UserLogVO;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Inject
	private StatisticsDAO dao;
	
	@Override
	public StatisticsVO sellStatistics() throws Exception {
		return dao.sellStatistics();
	}
	
	@Override
	public StatisticsVO priceStatistics() throws Exception {
		return dao.priceStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastPriceStatistics() throws Exception {
		return dao.contrastPriceStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastSellStatistics() throws Exception {
		return dao.contrastSellStatistics();
	}
	
	@Override
	public StatisticsVO connectionStatistics() throws Exception {
		return dao.connectionStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastConnStatistics() throws Exception {
		return dao.contrastConnStatistics();
	}
	
	@Override
	public StatisticsVO createStatistics() throws Exception {
		return dao.createStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastCreateStatistics() throws Exception {
		return dao.contrastCreateStatistics();
	}
	
	@Override
	public StatisticsVO deleteStatistics() throws Exception {
		return dao.deleteStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastDeleteStatistics() throws Exception {
		return dao.contrastDeleteStatistics();
	}
	
	@Override
	public StatisticsVO resumeStatistics() throws Exception {
		return dao.resumeStatistics();
	}
	
	@Override
	public MonthStatisticsVO contrastResumeStatistics() throws Exception {
		return dao.contrastResumeStatistics();
	}
	
	@Override
	public UserLogVO joinCount() throws Exception {
		return dao.joinCount();
	}
	
	@Override
	public SellItemLogVO dailySum() throws Exception {
		return dao.dailySum();
	}
	
	@Override
	public UserLogVO dailyCount() throws Exception {
		return dao.dailyCount();
	}
	
	@Override
	public UserLogVO dailyResume() throws Exception {
		return dao.dailyResume();
	}
}
