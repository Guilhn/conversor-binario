package br.edu.utfpr.conversor_binario.model.domain;

import lombok.*;
import javax.persistence.*;

@Entity
@Table(name = "states")
@Data
@NoArgsConstructor
@RequiredArgsConstructor(access = AccessLevel.PUBLIC)
public class State {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @NonNull
    private String name;
}
