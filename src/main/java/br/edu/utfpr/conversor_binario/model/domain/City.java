package br.edu.utfpr.conversor_binario.model.domain;

import lombok.*;
import javax.persistence.*;

@Entity
@Table(name = "cities")
@Data
@NoArgsConstructor
@RequiredArgsConstructor(access = AccessLevel.PUBLIC)
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NonNull
    private String name;

    @ManyToOne
    @NonNull
    private State state;
}
