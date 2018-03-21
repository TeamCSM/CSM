package com.csm.admin.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.csm.market.domain.SellItemLogVO;
import com.csm.matching.domain.MonthStatisticsVO;
import com.csm.matching.domain.StatisticsVO;
import com.csm.user.domain.UserLogVO;

@Repository
public class StatisticsDAOImpl implements StatisticsDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.csm.mapper.AdminMapper";
	
	@Override
	public StatisticsVO sellStatistics() throws Exception {
		return session.selectOne(namespace +".sellStatistics");
	}
	
	@Override
	public StatisticsVO priceStatistics() throws Exception {
		return session.selectOne(namespace +".priceStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastPriceStatistics() throws Exception {
		return session.selectOne(namespace +".contrastPriceStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastSellStatistics() throws Exception {
		return session.selectOne(namespace +".contrastSellStatistics");
	}
	
	@Override
	public StatisticsVO connectionStatistics() throws Exception {
		return session.selectOne(namespace +".connectionStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastConnStatistics() throws Exception {
		return session.selectOne(namespace +".contrastConnStatistics");
	}
	
	@Override
	public StatisticsVO createStatistics() throws Exception {
		return session.selectOne(namespace +".createStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastCreateStatistics() throws Exception {
		return session.selectOne(namespace +".contrastCreateStatistics");
	}
	
	@Override
	public StatisticsVO deleteStatistics() throws Exception {
		return session.selectOne(namespace +".deleteStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastDeleteStatistics() throws Exception {
		return session.selectOne(namespace +".contrastDeleteStatistics");
	}
	
	@Override
	public StatisticsVO resumeStatistics() throws Exception {
		return session.selectOne(namespace +".resumeStatistics");
	}
	
	@Override
	public MonthStatisticsVO contrastResumeStatistics() throws Exception {
		return session.selectOne(namespace +".contrastResumeStatistics");
	}
	
	@Override
	public UserLogVO joinCount() throws Exception {
		return session.selectOne(namespace +".joinCount");
	}
	
	@Override
	public SellItemLogVO dailySum() throws Exception {
		return session.selectOne(namespace +".dailySum");
	}
	
	@Override
	public UserLogVO dailyCount() throws Exception {
		return session.selectOne(namespace +".dailyCount");
	}
	
	@Override
	public UserLogVO dailyResume() throws Exception {
		return session.selectOne(namespace +".dailyResume");
	}
}
