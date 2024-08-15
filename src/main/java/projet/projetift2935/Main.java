package projet.projetift2935;

import jakarta.persistence.*;
import javafx.animation.PauseTransition;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.layout.*;
import javafx.scene.text.Font;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import javafx.util.Duration;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.StringJoiner;

public class Main extends Application {

    private EntityManager sqlEM = null;
    private final TextArea out = new TextArea();
    private final Button submitButton = new Button("Submit Request");

    public static void main(String[] args) {
        launch(args);
    }
    @Override
    public void start(Stage stage) {
        Map<String, Object> emfProperties = new HashMap<>();
        try {
            BufferedReader bf = new BufferedReader(new FileReader("SQLCredentials.txt"));
            bf.readLine();
            String URL = "jdbc:postgresql://" + bf.readLine();
            bf.readLine();
            String user = bf.readLine();
            bf.readLine();
            String password = bf.readLine();
            emfProperties.put("jakarta.persistence.jdbc.url", URL);
            emfProperties.put("jakarta.persistence.jdbc.user", user);
            emfProperties.put("jakarta.persistence.jdbc.password",password);
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("default", emfProperties);
            sqlEM = emf.createEntityManager();
        } catch (Exception e) {
            e.printStackTrace();
        }
        String q1 = """
               select ar.arbitreID, ar.nom, ar.role, count(sa.sanctionID) as total_carton
               from Arbitre ar
               left join Gere ge on ar.arbitreID=ge.arbitreID
               left join Match ma on ge.matchID=ma.matchID
               left join Sanction sa on ma.matchID = sa.matchID
               group by ar.arbitreID
               order by total_carton desc
               """;
        String q2 = """
               select jo.nom, jo.numero, jo.position, eq.pays, eq.annee, count(bu.butID) as total_but
               from Joueur jo
               left join Equipe eq ON jo.equipeID = eq.equipeID
               left join But bu ON jo.joueurID = bu.joueurID
               group by jo.joueurID, eq.equipeID, jo.nom, jo.numero, jo.position, eq.pays, eq.annee
               order by total_but desc
               """;
        String q3 = """
               select eq.equipeID, eq.pays, eq.annee, count (bu.joueurID) as total_but, count(bu.passeID) as total_passe
               from Equipe eq
               left join Joueur jo on eq.equipeID = jo.equipeID
               Left join But bu on jo.joueurID = bu.joueurID
               group by eq.equipeID
               order by eq.pays
               """;

        String q4 = """
               select ma.date, ma.scoreEquipe1, ma.scoreEquipe2, ma.rang, ar.nom, st.nomDuStade, st.pays, st.ville
               from Match ma
               inner join Gere ge on ma.matchID = ge.matchID
               inner join Arbitre ar on ge.arbitreID = ar.arbitreID and ar.role = 'Principal'
               inner join Stade st on ma.stade = st.nomDuStade
               """;
        BorderPane root = new BorderPane();
        root.setPadding(new Insets(40, 10, 10, 10));

        // Titre
        Text title = new Text("La coupe du monde des nations du football");
        title.setFont(Font.font("Nunito", 35));
        StackPane titlePane = new StackPane(title);
        BorderPane.setAlignment(titlePane, Pos.CENTER);
        title.setStyle("-fx-underline: true;"); // Underline the text
        root.setTop(titlePane);

        // Boutons
        VBox buttonsBox = new VBox(10);
        buttonsBox.setPadding(new Insets(10));
        buttonsBox.setAlignment(Pos.CENTER);
        Button button0 = new Button("Custom Request");
        Button button1 = new Button("Requête 1");
        Button button2 = new Button("Requête 2");
        Button button3 = new Button("Requête 3");
        Button button4 = new Button("Requête 4");
        // Style pour les boutons
        button0.setPrefWidth(175);
        button0.setPrefHeight(70);
        button0.setFont(Font.font("Nunito", 20));
        button1.setPrefWidth(175);
        button1.setPrefHeight(70);
        button1.setFont(Font.font("Nunito", 20));
        button2.setPrefWidth(175);
        button2.setPrefHeight(70);
        button2.setFont(Font.font("Nunito", 20));
        button3.setPrefWidth(175);
        button3.setPrefHeight(70);
        button3.setFont(Font.font("Nunito", 20));
        button4.setPrefWidth(175);
        button4.setPrefHeight(70);
        button4.setFont(Font.font("Nunito", 20));
        VBox.setMargin(button0, new Insets(0, 0, 30, 0));
        VBox.setMargin(button1, new Insets(0, 0, 30, 0));
        VBox.setMargin(button2, new Insets(0, 0, 30, 0));
        VBox.setMargin(button3, new Insets(0, 0, 30, 0));
        buttonsBox.getChildren().addAll(button0, button1, button2, button3, button4);
        root.setLeft(buttonsBox);

        // Text area
        out.setPrefSize(600, 500);
        out.setEditable(false);
        out.setStyle("-fx-font-size: 18px;");

        submitButton.setFont(Font.font("Nunito", 20));
        submitButton.setPrefWidth(175);
        submitButton.setPrefHeight(70);
        submitButton.setStyle("-fx-font-size: 18px;");
        submitButton.setVisible(false);

        StackPane stackPane = new StackPane();
        stackPane.setMaxSize(720, 510);
        stackPane.getChildren().add(out);
        stackPane.getChildren().add(submitButton);
        StackPane.setAlignment(submitButton, Pos.BOTTOM_RIGHT);

        root.setCenter(stackPane);


        // Button event handlers to update the text area
        button0.setOnAction(event -> {
            out.setText("""
                    Enter request here...
                    Format for the select request:
                    [select_clause]
                    from_clause
                    [where_clause]
                    [groupby_clause]
                    [having_clause]
                    [orderby_clause]
                    """);
            out.setStyle("-fx-text-fill: gray; -fx-font-style: italic; -fx-font-size: 18px;");
            out.setEditable(true);
            out.setOnMouseClicked(eventClick -> {
                out.clear();
                out.setStyle("-fx-text-fill: black; -fx-font-size: 18px;");
                submitButton.setVisible(true);
                out.setOnMouseClicked(noEvent -> {});
            });
        });
        submitButton.setOnAction(event -> sendCustomRequest());
        button1.setOnAction(event -> sendPremadeRequest(q1, 0));
        button2.setOnAction(event -> sendPremadeRequest(q2, 3));
        button3.setOnAction(event -> sendPremadeRequest(q3, 0));
        button4.setOnAction(event -> sendPremadeRequest(q4, 0));



        // Écran principal
        Scene scene = new Scene(root, 1000, 700);
        stage.setTitle("Projet - IFT 2935");
        stage.setScene(scene);
        stage.show();
        button0.fire();
    }
    public String formatRequestOutput(Query q) {
        StringBuilder queryResult = new StringBuilder();
        for (Object ligne : q.getResultList()) {
            StringJoiner lineBuilder = new StringJoiner(", ");
            if (ligne instanceof Object[])
                for (Object attribut : (Object[]) ligne) {
                    lineBuilder.add(attribut.toString());
                }
            else
                lineBuilder.add(ligne.toString());
            queryResult.append(lineBuilder).append(";\n");
        }
        return queryResult.toString();
    }
    public void sendPremadeRequest(String request, int maxResults) {
        out.setStyle("-fx-font-size: 18px;");
        submitButton.setVisible(false);
        if (sqlEM == null)
            out.setText("PostgreSQL authentification failed!\nPlease change your credentials in SQLCredentials.txt " +
                    "and restart.");
        else {
            if (maxResults == 0)
                out.setText(formatRequestOutput(sqlEM.createQuery(request)));
            else
                out.setText(formatRequestOutput(sqlEM.createQuery(request).setMaxResults(maxResults)));
        }
    }
    public void sendCustomRequest() {
        if (sqlEM == null)
            out.setText("PostgreSQL authentification failed!\nPlease change your credentials in SQLCredentials.txt " +
                    "and restart.");
        else {
            try {
                out.setText(formatRequestOutput(sqlEM.createQuery(out.getText())));
                submitButton.setVisible(false);
            }
            catch (Exception e) {
                System.out.println(e);
                String invRequest = out.getText();
                out.setText("Invalid Request! See console for details");
                submitButton.setText("Invalid Request!");
                submitButton.setDisable(true);
                PauseTransition pause = new PauseTransition(Duration.seconds(1.5));
                pause.setOnFinished(event -> {
                    submitButton.setText("Submit Request");
                    submitButton.setDisable(false);
                    out.setText(invRequest);
                });
                pause.play();
            }
        }
    }
}
