package com.kevinhuynh.riotgamesstattracker.controllers;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kevinhuynh.riotgamesstattracker.models.Summoner;
import com.kevinhuynh.riotgamesstattracker.services.SummonerService;

@Controller
public class HomeController {
	
	private Summoner currentSummoner;
	private String[] matchHistory;
	private HashMap<String, HashMap<String, Object>> matchData;
	private HashMap<String, Object> blueTeam;
	private HashMap<String, Object> redTeam;
	
	@Autowired 
	private SummonerService summonerService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("summoner", new Summoner());
		return "index.jsp";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("summonerData", currentSummoner);
		model.addAttribute("matchHistory", matchHistory);
		model.addAttribute("blueTeam", blueTeam);
		model.addAttribute("redTeam", redTeam);

			System.out.println("*************");
			for (String summoner : blueTeam.keySet()) {
				System.out.println(blueTeam.get(summoner).getClass().getName());
				// System.out.println(blueTeam.get(summoner)); 	
			}
		
		// System.out.println(matchData.get("blueTeam").get("Mebbies"));
		return "dashboard.jsp";
	}
	
	
	@PostMapping("/summoner")
	public String displaySummoner(@ModelAttribute("summoner") Summoner summoner, Model model) {
		ArrayList<Object> summonerData = summonerService.getSummonerData(summoner.getName());
		Summoner fullSummoner = summonerService.toSummoner(summonerData);
		currentSummoner = fullSummoner;
		matchHistory = summonerService.getMatchList(fullSummoner.getPuuid());
		matchData = summonerService.getMatchData("NA1_4415485841");
		blueTeam = matchData.get("blueTeam");
		redTeam = matchData.get("redTeam");


		System.out.println(blueTeam);
		System.out.println("***************");
		System.out.println(redTeam);
		System.out.println(matchData.keySet());
		return "redirect:/dashboard";
	}
}