package com.kevinhuynh.riotgamesstattracker.services;

import java.util.ArrayList;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kevinhuynh.riotgamesstattracker.models.Summoner;
import com.kevinhuynh.riotgamesstattracker.repositories.SummonerRepository;

@Service
public class SummonerService {

	@Autowired
	private SummonerRepository summonerRepository;
	
	private final String API_KEY = "RGAPI-f157dee6-1299-4ec2-a123-17ca7ae69d5c";
	private final String GET_SUMMONER_DATA_API_CALL = "https://na1.api.riotgames.com/lol/summoner/v4/summoners/by-name/";
	private final String GET_MATCH_HISTORY_API_CALL = "https://americas.api.riotgames.com/lol/match/v5/matches/by-puuid/";
	private final String GET_MATCH_DATA_API_CALL = "https://americas.api.riotgames.com/lol/match/v5/matches/";
	
	public ArrayList<Object> getSummonerData(String summonerName) {
		String url = GET_SUMMONER_DATA_API_CALL + summonerName + "?api_key=" + API_KEY;
		ArrayList<Object> summonerData = new ArrayList<Object>();
		RestTemplate restTemplate = new RestTemplate();
		String result = restTemplate.getForObject(url, String.class);
		String jsonString = result;
		JSONObject obj = new JSONObject(jsonString);
		String id = obj.getString("id");
		String accountId = obj.getString("accountId");
		String puuid = obj.getString("puuid");
		Long level = obj.getLong("summonerLevel");
		summonerData.add(id);
		summonerData.add(accountId);
		summonerData.add(puuid);
		summonerData.add(level);
		return summonerData;
	}
	
	public Summoner createSummoner(Summoner summoner) {
		return summonerRepository.save(summoner);
	}
	
	public Summoner toSummoner(ArrayList<Object> summonerData) {
		Summoner summoner = new Summoner();
		summoner.setAccountId((String) summonerData.get(0));
		summoner.setSummonerId((String) summonerData.get(1));
		summoner.setPuuid((String) summonerData.get(2));
		summoner.setLevel((Long) summonerData.get(3));
		return summoner;
	}
	
	public String[] getMatchList(String puuid) {
//		ArrayList<String> matchHistory = new ArrayList<String>();
		String url = GET_MATCH_HISTORY_API_CALL + puuid + "/ids?start=0&count=20&api_key=" + API_KEY;
		RestTemplate restTemplate = new RestTemplate();
		String[] match = restTemplate.getForObject(url, String[].class);
		return match;
	}
	
	public Map<String, String> getMatchData(String matchId) {
		String url = GET_MATCH_DATA_API_CALL+ matchId + "?api_key=" + API_KEY;
		System.out.println(url);
		ArrayList<Object> matchData = new ArrayList<Object>();
		RestTemplate restTemplate = new RestTemplate();
		Map<String, String> result = restTemplate.getForObject(url, Map.class);
//		String jsonString = result;
//		JSONObject obj = new JSONObject(jsonString);
//		String jsonString = result;
//		JSONObject obj = new JSONObject(jsonString);
		System.out.println(result);
		
		return result;
	}
	
}
