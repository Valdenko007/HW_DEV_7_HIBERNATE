package ua.goit.model;

import lombok.*;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(exclude = {"projects","skills"})
@ToString(exclude = {"projects","skills"})
@Entity
@Table(name = "developers")
public class Developer implements BaseEntity<Long> {

    private static final long serialVersionUID = -5808937699282505273L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "age")
    private Integer age;

    @Column(name = "gender")
    private String gender;

    @Column(name = "salary")
    private Long salary;

    @ManyToMany(mappedBy = "developers")
    private Set<Project> projects;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(
            name = "developers_skills",
            joinColumns = {@JoinColumn(name = "id_developer")},
            inverseJoinColumns = {@JoinColumn(name = "id_skill")})
    private Set<Skills> skills;

}

