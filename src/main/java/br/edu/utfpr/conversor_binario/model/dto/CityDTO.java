package br.edu.utfpr.conversor_binario.model.dto;

import br.edu.utfpr.conversor_binario.model.domain.State;
import lombok.Data;
import lombok.NonNull;

@Data
public class CityDTO {
    @NonNull
    private String name;
    @NonNull
    private StateDTO state;
}
