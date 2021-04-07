package br.edu.utfpr.conversor_binario.model.mapper;

import br.edu.utfpr.conversor_binario.model.domain.City;
import br.edu.utfpr.conversor_binario.model.domain.State;
import br.edu.utfpr.conversor_binario.model.dto.CityDTO;
import br.edu.utfpr.conversor_binario.model.dto.StateDTO;


public class StateMapper {

    public StateMapper getInstance(){
        return new StateMapper();
    }

    public static State toEntity(StateDTO dto){
        State entity = new State(dto.getName());
        return entity;
    }

    public static StateDTO toDTO(State entity){
        StateDTO dto = new StateDTO(entity.getName());
        return dto;
    }
}
