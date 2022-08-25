package com.kevinhuynh.riotgamesstattracker.repositories;

import org.springframework.data.repository.CrudRepository;

import com.kevinhuynh.riotgamesstattracker.models.Summoner;

public interface SummonerRepository extends CrudRepository<Summoner, Long> {

}
