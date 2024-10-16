
## Sommaire
1 - Présentation du modèle métier

2 - Persistance des données (JPA)

3 - Communication avec la base de donnée (Data Layer)
- **Version 1 :**  Data Access Object (DAO)
- **Version 2 :** Spring Repository

4 - Partie métier / controller
- Data Transfer Object (DTO)
- Mapping entité vers DTO (MapStruct)
- Logique métier (Service)
- Gestion des Exception (ExceptionHandler)
- Controller (JAX-RS, et annotations Spring)
	
5 - Documentation swagger (OpenAPI)

6 - Gestion d'autorisation (keycloack)

7 - Log avec la programmation par aspect (AOP)

---
## 1 -Présentation du modèle métier
Le modèle métier de l'application :
![[Capture d’écran 2024-10-11 à 17.08.05.png]]


## 2 - Persistance des données (JPA)

### A - La annotation de base
Pour l'ensemble des classe de notre modèle de donnée, nous ajouté les annotation pour pouvoir les mapper avec notre Base de donnée (*hsqldb*). Voici un exemple de ce qui a été faiit :

```java
@Entity  
public abstract class Kahoot {  
  
    @Id  
    @GeneratedValue    
    private Long id;  
  
	//Reste des attributs

	//getter & setter
}
```

- `@Entity` indique que notre POJO (plain old java object) sera une table dans notre base de donnée.
- `@Id` indique que l'attribut désigné sera la clé primaire dans notre table. 
- `@GeneratedValue`Indique la manière dont l'id va être géré. Par défaut la gestion de cette id est confié à la base de donnée. (*chose qui pourrait changer si on souhaite utiliser les même id que ceux généré par keycloack*)

### B - Les relations

EN plus des éléments ajoutés dans la partie précédente on doit également gérer l'ensemble des relations entres les entitées.
En gardant l'exemple du kahoot on va se concentré sur une première relation 1 -> N **(One to Many**)

class **Kahoot** :
```java
@Entity  
@Data  
public abstract class Kahoot {  
  
	//Autres attributs
  
    @ManyToOne  
	private User owner;

	//getters & setter
}
```

class **User** : 
```java
@Entity  
public class User {  

	//autres attributs
  
    @OneToMany(mappedBy = "owner")  
    private Collection<Kahoot> ownedKahoot;  

	//autrs attributs 
	//getters & setters
  
}
```
> Cette relation indique qu'un Kahoot a un créateur, et qu'un utilisateur peut être le créateur/propriétaire d'un ou plusieurs Kahoot.

Toutes le relations de notre projet seront des relations de ce même type #A_Corriger⛔️

## 3 - Communication avec la base de donnée (Data Layer)

### A -**Version 1 :**  Data Access Object (DAO)

Pour gérer l'accès à la base de donnée sans Spring en utilisant des Data Access Object, nous avons fait le choix d'essayer de faire un premier Dao generic qui pourrait être compléter si nécessaire par chaque entités.

Pour ce faire on a d'abord déclarer une première interface avec les méthode importante pour le projet.

**Interface IGenericDao :**
```java
public interface IGenericDao<K, T> {  
  
    T findOne(final K id);  
  
    List<T> findAll();  
  
    void save(final T entity);  
  
    void update(final T entity);  
  
    void delete(final T entity);  
  
    void deleteById(final K entityId);  
}
```
Ensuite une classe abstraite s'occupe de fournir l'implémentation de cette class de manière générique.

**Interface AbstractJpaDao :**
```java
public abstract class AbstractJpaDao<K, T> implements IGenericDao<K, T> {  
  
    @Setter  
    private Class<T> clazz;  
  
    protected EntityManager entityManager;  
  
    public AbstractJpaDao(Class<T> clazz) {  
        this.entityManager = EntityManagerHelper.getEntityManager();  
        this.clazz = clazz;  
    }  
  
    public T findOne(K id) {  
        return entityManager.find(clazz, id);  
    }  
  
    public List<T> findAll() {  
        return entityManager.createQuery("select e from " + :className + " as e", clazz).getResultList();  
    }

//Reste des méthode implémenté
}
```

Pour voir le reste des méthodes implémenté [cliquer-ici](lien vers la class complète)
# //TOO CORRIGER ICI ⛔️


Et finalement pour chaque entité on aura une interface qui va étendre notre interface générique (**IGenericDao**).

On va retrouver par exemple `IKahootDAO` :

```java
public interface IKahootDao extends IGenericDao<Long, Kahoot> {  
  
    Kahoot findKahootByPin(Long pin);  
}
```

Avec sa class d'implémentation qui ne nécessitera pas d'implémenter les méthodes générique, mais seulement les méthode personnalisé : 

> Peut être expliqué pourquoi mais je ne penses pas ⛔️
```java 
public class KahootDaoImpl extends AbstractJpaDao<Long, Kahoot> implements IKahootDao {  
  
    public KahootDaoImpl() {  
        super(Kahoot.class);  
    }  
  
    @Override  
    public Kahoot findKahootByPin(Long pin) {  
        Query mediaQuery = entityManager.createQuery("select e from " + Kahoot.class.getName() + " as e WHERE e.pin = :pin", Kahoot.class);  
        mediaQuery.setParameter("pin", pin);  
        return (Kahoot) mediaQuery.getSingleResult();  
    }  
}
```

### B -  **Version 2 :** Spring Repository

Pour la deuxième version du projet nous n'avons pas eu a implémenter de Data Access Object (**DAO**) Nous avons simplement définit des Interface tel que `KahootRepository` :

```java
public interface KahootRepository extends JpaRepository<Kahoot, Long> {  
}
```

Qui étend l'interface `JpaRepository` en définissant le type de l'entité concerné ainsi que le type de l'identifiant.

Aucune implémentation de cette **class** n'est nécessaire, Spring Boot s'en chargera.

Il est tout de même possible de rajouter des requête personalisé, avec ⛔️énoncer les 3 manière

# //TODO CORRIGER ET EN RAJOUTANT UNE REQUÊTE JPQL⛔️


## 4 - Partie métier / controller

### A - Data Transfer Object (DTO)

Dans ce projet, on utilise les **Data Transfer Objects (DTO)** pour simplifier l'échange de données entre les différentes parties de l'application, notamment entre le backend (Spring Boot) et les clients qui consomment notre API.

Exactement, les DTO permettent aussi de maintenir une séparation claire entre les entités du domaine (qui représentent les données internes de l'application) et les objets utilisés par le contrôleur. Cela évite d'exposer directement les entités de la base de données aux clients, ce qui protège la structure interne et facilite l'évolution de l'application sans impacter l'API.

En gardant l'exemple de l'entité Kahoot voici à quoi va ressembler son DTO (sous forme d'un record): 
```java 
public record KahootDto(Long id, String title, Long pin, KahootType kahootType) {  
}
```

### B - Mapping entité vers DTO (MapStruct)

Pour passer d'une entité à un DTO et inversement il faut faire appel à un Mapper. Nous allons pour la suite utiliser `MapStruct`. 

Le cas du Kahoot dans notre projet est un bon exemple d'utilisation de MapStruct. En effet s'agissant d'une classe abstraite On ne pouvait pas savoir si nous allions récupérer un DTO d'une de ces classe d'implémentation tel que Quiz ou StrawPoll. 
Nous avons donc décidé de renvoyer un KahootDto contenant les paramètre generic d'un Kahoot en plus d'un Type indiquant si il s'agissait d'un Quiz ou d'un StrawPol.

Le mapper peut être retrouvé dans son intégralité en [cliquant-ici](test.com).

### C -  Logique métier (Service)

Pour présenter la partie Service de notre API nous allons présenter une méthode qui est probablement la plus parlante.

```java
@Transactional  
@Override  
public KahootDto createKahoot(KahootDto kahootDto, Long userId) {  
    if (kahootDto == null) {  
        throw new ValidationException("The kahoot DTO cannot be null.");  
    }  
    if (kahootDto.id() != null) {  
        throw new IllegalIdOnCreateException("The kahoot ID must not already be defined at the time of creation.");  
    }  
    if (userId == null) {  
        throw new ValidationException("The User Id cannot be null.");  
    }  
  
    User user = userRepository.findById(userId)  
            .orElseThrow(() -> new UserNotFoundException(userId));  
  
    Kahoot kahoot = kahootMapper.toEntity(kahootDto);  
    kahootRepository.save(kahoot);  
  
    user.getOwnedKahoot().add(kahoot);  
    userRepository.save(user);  
  
    return kahootMapper.toDto(kahoot);  
}
```

Dans un premier temps le service createKahoot va recevoir en paramètre un `KahootDto`.
Le service va tout d'abord faire quelque vérification tel que le kahootDto ne doit pas être null. l'id du `KahootDto`doit être nul, sinon en enregistrant en base de donnée avec un id incorrecte une Exception serait throw(Ces controls pourraient potentiellement être réaliser grace à l'**AOP** ).

Après avoir vérifier tout ca on va récupérer un Utilisateur et évidement throw une Exception en cas d'erreur. 

et finalement nous allons utiliser notre `Mapper` pour obtenir une entité grace à notre DTO puis finalement le save.

Pour assurer la **transitivité de persistance** nous allons ajouter le kahoot précédemment save à l'utilisateur qu'on vient de récupérer, et le save à son tour.

Le kahoot est créé il ne reste donc plus qu'a le renvoyer.

### D- Gestion des Exception (ExceptionHandler)
##### ℹ️ **PARTIE SPING UNIQUEMENT**ℹ️

Grâce à son fonctionnement, le framework Spring Boot permet d'attraper et traiter n'importe quelle Exception.
Pour ce faire nous avons implémenter une class [`CustomExceptionHandler`](test.com)

Son role va être d'effectuer un traitement spécifique en fonction de certaines Exception choisit.
Par exemple pour gérer le cas ou une entité n'est pas trouvé nous allons pouvoir faire appel à la méthode `handleNotFound`.
```java

@ExceptionHandler({KahootNotFoundException.class, AnswerNotFoundException.class, QuestionNotFoundException.class, UserNotFoundException.class})  
protected ResponseEntity<Object> handleNotFound(Exception ex, WebRequest request) {  
    Map<String, String> responseBody = new HashMap<>();  
    responseBody.put("error", "Not Found");  
    responseBody.put("message", "Ressource non trouvée");  
  
    return handleExceptionInternal(ex, responseBody, new HttpHeaders(), HttpStatus.NOT_FOUND, request);  
}
```

Celle si renverra une ResponseEntity au format json avec la raison et le status HTTP. 

Evitant ainsi la multiplication de try catch partout dans le code.
### E -Controller (JAX-RS, et annotations Spring)

##### E.1 - JAX-RS

##### E.2 - Annotation Spring 

Pour déclarer un Controller en Spring la logique reste la même qu'avec JaxRS, avec de légère différences. On constate tout de même la simplification qu'a pu apporter le CustomExceptionHandler en traitant les Exception. ne laissant la plus que les appels services.

```java
@RestController  
@RequestMapping(value = "/api/kahoot")  
public class KahootController {  
 
    @PostMapping("/createKahoot/{userId}")  
    public ResponseEntity<KahootDto> createKahoot(KahootDto kahootDto, @PathVariable Long userId) {  
        return ResponseEntity.status(HttpStatus.CREATED)  
                .body(kahootService.createKahoot(kahootDto, userId));  
    }  
  
  
    @GetMapping("/{kahootId}")  
    public ResponseEntity<KahootDto> getKahootById(@PathVariable Long kahootId) {  
        return ResponseEntity.status(HttpStatus.CREATED)  
                .body(kahootService.findKahootById(kahootId));  
    }  
  
  
    @GetMapping("/getAll")  
    public ResponseEntity<List<KahootDto>> getAllKahoot() {  
        return ResponseEntity.status(HttpStatus.OK)  
                .body(kahootService.findALl());  
    }  
  
  
    @DeleteMapping("/{kahootId}")  
    public ResponseEntity<Void> deleteKahoot(@PathVariable Long kahootId) {  
        kahootService.deleteKahoot(kahootId);  
        return ResponseEntity.noContent().build();  // Retourne un statut 204 No Content si la suppression est réussie  
    }  
  
   
    @PutMapping("/updateKahoot")  
    public ResponseEntity<KahootDto> updateKahoot(@RequestBody KahootDto kahootDto) {  
        KahootDto updatedKahoot = kahootService.updateKahoot(kahootDto);  
        return ResponseEntity.status(HttpStatus.OK).body(updatedKahoot);  
    }  
}
```

On retrouve ces annotations : 
- `@RestController` : Indique que la classe est un contrôleur web dans une application Spring MVC. Elle combine les annotations `@Controller` et `@ResponseBody`, ce qui signifie que les méthodes de la classe retourneront directement les données JSON/XML au lieu de rendre une vue (template HTML).
    
- `@RequestMapping(value = "/api/kahoot")` : Elle mappe les requêtes HTTP entrantes sur des méthodes de gestion spécifiques d'un contrôleur. Le chemin `/api/kahoot` est utilisé comme point de base pour toutes les routes définies dans cette classe, ce qui signifie que toutes les routes commençant par ce chemin seront gérées ici.
    
- `@PostMapping("/createKahoot/{userId}")` : Cette annotation est utilisée pour gérer une requête HTTP POST. Elle est associée à une méthode qui permet de créer un nouveau Kahoot en utilisant l'ID de l'utilisateur passé en paramètre de chemin `{userId}`.
    
- `@GetMapping("/{kahootId}")` : Cette annotation est utilisée pour gérer les requêtes HTTP GET. Elle permet de récupérer un Kahoot spécifique en fonction de son ID, passé en tant que paramètre de chemin `{kahootId}`.
    
- `@DeleteMapping("/{kahootId}")` : Utilisée pour gérer une requête HTTP DELETE, cette annotation permet de supprimer un Kahoot spécifique identifié par son ID dans l'URL.
    
- `@PutMapping("/updateKahoot")` : Cette annotation gère les requêtes HTTP PUT. Elle est utilisée pour mettre à jour un Kahoot existant. Les données du Kahoot à mettre à jour sont souvent envoyées dans le corps de la requête.

## 5 - Documentation swagger (OpenAPI)

# 🏗️🏗️🏗️🏗️🏗️🏗️

## 6 - Gestion d'autorisation (keycloack)

Nous avons implémenter 


## 7 - Log avec la programmation par aspect (AOP)