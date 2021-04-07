package br.edu.utfpr.conversor_binario.model.dto;

import br.edu.utfpr.conversor_binario.model.domain.State;
import lombok.Data;
import lombok.NonNull;

@Data
public class StateDTO {
    @NonNull
    private String name;
}
