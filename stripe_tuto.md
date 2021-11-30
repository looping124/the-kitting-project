## lntégrer Stripe version 2019

---

## 1. Introduction

Vous avez branché Stripe avec succès sur votre app Rails ? Bien joué 🔥 !

Dans ce cas, sauf bug dans la Matrice, vous devriez aboutir à une interface de paiement qui se présente comme ceci :

![Illustration Legacy](https://www.learndash.com/support/wp-content/uploads/2019/03/stripe-learndash-payment-modal-example-306x400.jpg)

Avec ça, vous pouvez déjà vous amuser à faire tout un tas de fake paiements sur votre site et voir le chiffre d'affaires s'accumuler sur votre dashboard Stripe 💰

Tant que vous utiliserez les **clefs d'API Stripe réservées au test**, ce sera toujours des données bidons, mais c'est quand même déjà la classe à Dallas 😎

*Ceci étant dit...*

Ce que nous avons ici est la version de Stripe Checkout dite **"Legacy"**, a.k.a à l'ancienne, pour le paiement en ligne.

Alors, dans les paragraphes qui suivent, je vous propose d'**intégrer Stripe version 2019**, pour que vous ayez des formulaires de paiement BG sur votre site !



## 2. Historique et contexte

**Stripe Checkout Legacy...**

- À l'époque où c'est sorti, c'était sans nul doute un truc de dingos 🤯, qui a apporté au fur et à mesure une âpre concurrence au mastodonte [Paypal](https://www.paypal.com/fr/webapps/mpp/home) pour le paiement en ligne.
- Globalement, [l'implémentation dans une app Rails](https://stripe.com/docs/legacy-checkout/rails) est plutôt (très) accessible, ce qui est avantageux pour nous autres moussaillons de THP si tant est que l'on souhaite se familiariser avec l'univers des APIs.

Mais aujourd'hui, **cette version pose 2 problèmes majeurs** :

- Niveau Webdesign, on ne va pas se mentir, ça semble **un poil vieillot tout ça**. *Je ne juge pas hein... Mais un peu quand même* 🙈 Plus sérieusement, vous pouvez faire le test avec vos proches, et voir comment ils perçoivent le paiement via le bouton bleu turquoise, en comparaison à d'autres standards plus actuels (Google Pay, Apple Pay etc.)

- Bien plus touchy encore que le côté cosmétique, il se trouve que **les formulaires Legacy ne sont plus conformes aux [normes européennes](https://apresta.fr/blog/nouvelle-norme-de-paiement-sca/#:~:text=La%20norme%2C%20ou%20l'authentification,jour%2C%20d'autres%20pas.) en matière de paiement en ligne** 😱 Concrètement, sur Legacy, vous n'avez pas "3D Secure" (vous savez, le texto / notification de votre banque avant la suite du paiement en ligne). Donc imaginons que demain un client européen de votre boutique en ligne passe par là, eh bien il est fort probable que ce soit directement sa banque qui fasse blocus lors de l'étape tant attendue du paiement.

La bonne nouvelle dans tout ça : Stripe a évidemment prévu le coup avec une **nouvelle version BG comme tout pour vos paiements en ligne 😎** :

![Illustration Legacy](https://stripe.com/img/docs/checkout/checkout-preview.png)



## 3. La ressource

Intégrer Legacy sur Rails, c'est plutôt easy grâce au [tutoriel de Stripe](https://stripe.com/docs/legacy-checkout/rails) à ce sujet. Par contre, pour partir sur la version 2019, je ne vous cache pas que c'est beaucoup plus complicado de savoir même par où commencer...

![confused Travolta](https://media.giphy.com/media/g01ZnwAUvutuK8GIQn/source.gif)

No worries ! On va se refaire tout le cheminement en souplesse et d'ici peu vous saurez comment **Intégrer Stripe version BG en 30 minutes top chrono.**

Parce qu'à un moment donné on va pas se laisser aller avec Legacy sur notre app, c'est la team Rails ici quand même 🔥

### 3.1. Pas à pas en vidéo

Voici d'abord [un tutoriel vidéo](https://www.youtube.com/watch?v=dzCEMMfx8cQ) qui reprend toute la logique, les pré-requis et les séquences concrètes de code qui vous permettront d'intégrer la nouvelle version :

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/dzCEMMfx8cQ/0.jpg)](https://www.youtube.com/watch?v=dzCEMMfx8cQ)

 I see you celles et ceux qui préfèrent l'écrit, ça arrive juste après 😇

### 3.2. Pré-requis

Globalement, **on est quasi sur les mêmes pré-requis techniques que ceux qui servent à faire fonctionner Stripe Checkout Legacy**... Avec quelques nouveautés tout de même, ce serait pas drôle sinon 😁

Bref, voici ce qu'il vous faut :

#### 3.2.1. Avoir un compte Stripe (merci Captain Obvious ❤️)

#### 3.2.2. Récupérer les clefs d'API

Si vous arrivez à ceci sur votre propre tableau de bord Stripe, c'est bon signe. Vous pouvez récupérer les 2 clefs d'API qui serviront à mettre en route l'engin de paiement sur votre app :

![illustration dashboard Stripe](https://kinsta.com/fr/wp-content/uploads/sites/4/2018/05/vos-cles-api-stripe.png)

#### 3.2.3. *Nouveauté* - Ajouter un nom public d'entreprise à votre compte Stripe

- Oui, ça peut paraître chelou cette histoire, mais il faut impérativement le faire, car ce nom apparaîtra entre autres sur les formulaires de paiement nouvelle génération.
- Tant que vous serez sur des paiements fictifs réalisés via les clefs API de test, je ne vois vraiment pas où seraient les conséquences juridiques ici. Bref, vous pouvez y aller, même avec un nom 100% certifié fake dédié au test 👌
- Par contre, pour des paiements réels évidemment la situation ne sera pas la même 😬 *Merci Captain Obvious, Epidode 2*
- Vous devriez trouver easy où effectuer cette configuration. En comparaison avec d'autres gros logiciels en ligne, le dashboard de Stripe est plutôt facile à lire. Mais parce que ça me fait plaisir, voici [la manip](https://www.loom.com/share/3ae7add227b748308ee079ef2fa555fb) si besoin.

#### 3.2.4. Configurer un fichier .env

* Bon, à ce stade vous connaissez la musique : vu qu'on est sur des infos assez sensibles avec les clefs d'API, mieux vaut les stocker en lieu sûr dans un fichier `.env`, avec le `.gitignore` qui va avec.
* Si besoin, vous pouvez toujours revenir sur [cette ressource en lien avec le projet Twitter](https://www.thehackingproject.org/fr/dashboard/courses/4/lessons/16) pour un tuto complet sur "dotenv" et un rappel de son utilité.

#### 3.2.5. Configurer l'initializer Stripe

* Même démarche que pour Legacy : il s'agit de créer un fichier `stripe.rb` dans `config/initializers`. et d'y ajouter les lignes suivantes :

  ```
  Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
  }Stripe.api_key = Rails.configuration.stripe[:secret_key]
  ```

* Bien entendu, il faudra que les dénominations `PUBLISHABLE_KEY` et/ou `SECRET_KEY` matchent avec les noms que vous avez choisis dans votre fichier `.env` pour stocker les clefs d'API.

#### 3.2.6. Ajouter la Gem "Stripe" dans votre Gemfile

On programme avec du Ruby, donc évidemment qu'il y a une Gem qui va avec 💎

#### 3.2.7. *Nouveauté* - Appeler les scripts BG de Stripe dans votre code HTML

* Et pour finir, on va appeler une **librairie de ressources gérées directement par Stripe : des scripts JS** en béton armé qui feront parfaitement le taff pour charger les formulaires de paiement en ligne BG sur votre page.

* Rien de foufou à coder ici : dans `app/views/layouts/application`, vous pouvez juste ajouter ceci quelque part dans votre balise `<head>` :

```
<script src="https://js.stripe.com/v3/"></script>
```

---

##### Ca y est ! Tout est prêt pour brancher Stripe nouvelle génération sur votre app, ça mérite bien un petit meme des familles tout ça 😍

<a href="https://imgflip.com/i/4sp3yq" style><img src="https://i.imgflip.com/4sp3yq.jpg" title="made at imgflip.com"/></a> 



### 3.3. Implémentation d'un "One-Time-Payment"

Allez, après toute cette mise en place, on va (enfin !) pouvoir coder concrètement la mise en route de l'engin de paiement sur notre app Rails 🔥

#### 3.3.1. Créer les routes vers la session de paiement

* Dans le fichier `config/routes.rb`, ajouter les lignes suivantes :

```
scope '/checkout' do
	post 'create', to: 'checkout#create', as: 'checkout_create'
	get 'success', to: 'checkout#success', as: 'checkout_success'
	get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
end
```

* Que se passe-t-il avec ces lignes de code ?
  * La ligne `post 'create'` va représenter la demande concrète de création d'une session sécurisée de paiement Stripe. Schématiquement, cette requête `POST` est envoyée à notre serveur, qui "fait suivre" le tout à Stripe via des appels d'API, qui lui-même nous renverra du contenu à l'écran.
  * Le système de Stripe veut que lors d'une session de paiement, on indique 2 URLs de redirection : une URL `success` sur laquelle on atterrit lorsque la session arrive à son terme, et une URL `cancel` lorsque la session est annulée par le client ou que le paiement échoue.
* Mais dis-donc Jamy, qu'est-ce que c'est que ce machin de `scope '/checkout'` ?
  * La notion de `scope`, tout comme celle de `namespace`, peut être vue comme un "pack" de routes qui sera accompagné de son ou ses controllers.
  * Si le sujet vous branche, je vous laisse apprécier la [différence entre scope et namespace](https://devblast.com/b/rails-5-routes-scope-vs-namespace).
  * Ici, j'ai choisi le `scope` pour minimiser la quantité de code à produire. Avec cette configuration de routes et un seul et unique controller `checkout`, j'aurai tout ce qu'il me faut pour exécuter le paiement sur mon app.
* Et pourquoi ne pas avoir utilisé ce bon vieux `resources` ici ?
  * Ca pourrait sembler être une bonne idée... Mais en fait pas tant que ça 😅
  * Je m'explique : dans mon `scope` checkout, j'ai déjà mes deux routes customisées `success`et `cancel`, qui sortent des clous si on utilise un `resources`.
  * Par ailleurs, en partant sur un `resources`, on crée par défaut des actions "edit", "update", "delete" etc. qui n'ont pas vraiment lieu d'être ici. [Bon chance](https://www.youtube.com/watch?v=cOsqUta2ol4&feature=youtu.be&t=45) si vous voulez permettre à l'utilisateur d'éditer ses infos de paiement sur Stripe avec un combo edit/update 😅
  * Bref, la seule route du schéma de `resources` qui compte, c'est la ligne `post 'create'`, donc autant s'en contenter !

#### 3.3.2. Ajouter un bouton de paiement qui crée la session Stripe

* À ce stade, vous avez sans doute déjà une view HTML disponible avec votre produit à payer, ou alors un "panier" composé de plusieurs produits, si vous êtes dans une logique de boutique en ligne.
* Voici donc du code que vous pouvez ajouter en bas de votre page HTML pour intégrer un bouton de paiement créant la session Stripe :

```
<%= button_to "Passer commande (NEXT GEN)", checkout_create_path(total: MONTANT À PAYER), class: "btn btn-primary", remote: true %>
```

* Quelques subtilités :
  * `button_to` permet d'exécuter sans problème la requête `POST`, a.k.a l'action de créer la session. For some reason, si on met un `link_to` ça ne fonctionnera pas 😭
  * Il est important ici de passer comme argument un `MONTANT À PAYER`.
    * Charge à chacun donc d'extraire le prix du produit/panier et de l'insérer ici.
    * Dans le contexte de la boutique en ligne, nous avions codé ceci : `(total: @cart.total)`. Cela permettait de récupérer le montant final du panier de l'utilisateur, afin que le paiement soit basé sur un prix cohérent.
    * Si vous ne l'avez pas encore codé, en attendant, vous pouvez toujours écrire en dur : `(total: 10)`. De cette façon, le produit vaudra 10 euros dans le paiement effectué sur le formumaire Stripe.
  * Enfin, `remote: true` est une requête AJAX, qui s'avèrera indispensable pour "injecter" du code Javascript dans notre page HTML. Et ce code Javascript... est tout simplement le formulaire de paiement Stripe lui-même ! Bref, impossible de s'en passer 😁

#### 3.3.3. Ecrire les méthodes du controller "checkout"

* On commence avec un petit `rails generate controller checkout` pour avoir le fichier à disposition.
* Et voici donc ce que vous pouvez ajouter dans `app/controllers/checkout.rb` :

```
class CheckoutController < ApplicationController

	def create
    @total = params[:total].to_d
    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [
        {
          name: 'Rails Stripe Checkout',
          amount: (@total*100).to_i,
          currency: 'eur',
          quantity: 1
        },
      ],
      success_url: checkout_success_url + '?session_id={CHECKOUT_SESSION_ID}',
      cancel_url: checkout_cancel_url
    )
    respond_to do |format|
      format.js # renders create.js.erb
    end
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)
  end

  def cancel
  end

end
```

* Quelques subtilités :
  * Notre montant total à payer, passé tout à l'heure en argument dans le bouton de paiement, est de retour ici : `@total = params[:total].to_d`.
  * Comme indiqué précédemment, le système Stripe demande de paramétrer des URLs de redirection `success` et `cancel`, que l'on retrouve codées dans la méthode "create".
  * Le paragraphe `respond_to do...` reprend la requête AJAX `remote: true` vue précédemment, pour injecter du contenu Javascript dans la page `create.js.erb` , qui sera une sorte de "réceptacle" à notre formulaire de paiement.
  * Le code `@session` de la méthode "success" vise à extraire de l'info sur la session de paiement qui vient d'avoir lieu. Le code `@payment_intent`, quant à lui, vise à extraire le montant qui a *réellement* été payé par l'utilisateur. Logique, nous sommes sur la page `success`, donc forcément celà signifie que l'utilisateur aura bien payé son produit.
* Mais dis-donc Jamy, pourquoi ne pas avoir mis de code `@payment_intent` dans la méthode "cancel", comme tu l'as fait dans la vidéo ?
  * En effet cher viewer, votre vision d'aigle m'impressionne ! Dans le [pas à pas en vidéo](https://www.youtube.com/watch?v=dzCEMMfx8cQ), j'ai écrit dans la méthode "cancel" du code tout à fait équivalent à "success".
  * *Et alors, c'était une bonne idée ?* Oui, mais non 😱 !
  * Je m'explique : quand un utilisateur est redirigé sur "cancel", cela signifie :
    * Que le paiement a échoué lors de la session.
    * **OU ALORS**, qu'il a simplement appuyé sur un bouton "Annuler" qui apparaît quelque part sur le formulaire avant même de procéder au paiement... Et voilà précisément tout le problème de coder un `@payment_intent` ici : la session n'a jamais réellement commencé, donc votre programme ne va rien capter si on lui demande tout à coup de publier à l'écran un `@payment_intent` qui n'existe pas 😬
  * Bref, je vous laisse gérer cette méthode "cancel" du controller et y mettre du code plus adéquat si cela s'avère pertinent.

#### 3.3.4. Ajouter du contenu dans les views "checkout"

Allez, on y est presque ! Il ne nous reste plus qu'à ajouter un peu de contenu dans un dossier `app/views/checkout` 🔥 Le code ci-dessous devrait parler de lui-même :

- Fichier `create.js.erb`

```
const stripe = Stripe('<%= Rails.configuration.stripe[:publishable_key] %>');
stripe.redirectToCheckout({
  sessionId: '<%= @session.id %>'
}).then(function (result) {
  console.log(result.error.message);
});
```

- Fichier `success.html.erb`

<div class="container text-center my-5">
  <h1>Succès</h1>
  <p>Nous avons bien reçu votre paiement de <%= number_to_currency(@payment_intent.amount_received / 100.0, unit: "€", separator: ",", delimiter: "", format: "%n %u") %>.</p>
  <p>Le statut de votre paiement est : <%= @payment_intent.status %>.</p>
</div>

- Fichier `cancel.html.erb`

<div class="container text-center my-5">
	<h1>Echec</h1>
  <p>Le paiement n'a pas abouti.</p>
</div>

---

**Et voilà ! Vous pouvez tester : sauf bug majeur dans la Matrice, vous avez maintenant un engin de paiement Stripe nouvelle génération et fonctionnel branché sur votre app Rails 🎉🎉🎉**

![confused Travolta](https://media.giphy.com/media/8Iv5lqKwKsZ2g/source.gif)



## 4. Points importants à retenir

- Stripe Checkout Legacy... 
  - C'est très bien pour découvrir l'univers du paiement en ligne Stripe et se familiariser avec la gestion des APIs sur votre app Rails.
  - En revanche, le système de paiement lui-même est obsolète, ou en passe de le devenir très prochainement.
- Autrement dit, si vous souhaitez mettre en route un système de paiement en ligne viable sur votre site, pas le choix, il va vous falloir migrer de la version Legacy vers la version 2019, ou implémenter cette dernière directement.
- Pour brancher cette nouvelle version sur Rails, je ne vous cache pas que l'info n'est clairement pas des plus accessibles. Je vous invite donc à voir ou revoir le [pas à pas en vidéo](https://www.youtube.com/watch?v=dzCEMMfx8cQ), ou suivre les étapes de cette ressource pour y parvenir sans difficulté.
- Si l'univers de Stripe vous intéresse et que vous souhaitez aller plus loin dans l'implémentation, je serais ravi de vous fournir d'autres infos pour vous aider. Voici mon contact sur Discord : [Quentin PLAUD](Quentin PLAUD#7166). Autant que les heures passées en tête-à-tête avec la documentation Stripe, les repos GitHub ou autres réjouissances servent au plus grand nombre 😁 

## 5. Pour aller plus loin

Dans cette ressource, on est sur le modèle de paiement en ligne le plus basique qui soit : le **"One-time payment"**. Par ailleurs, l'implémentation que je vous ai proposée est volontairement [minimaliste](https://www.welcometothejungle.com/fr/articles/minimalisme-travail-productivite-epanouissement) en termes de lignes de code. Rome ne s'est pas faite en un jour, et le branchement de la version 2019 est déjà suffisamment 🤯🤯🤯 comme ça. Bref, autant commencer par là avant d'aborder la suite !

Ceci étant dit, vous pouvez être certains que Stripe dispose de possibilités assez dingues, que je vous invite à découvrir si vos objectifs et votre appétence s'y prêtent. En voici un petit avant-goût :

- Synchroniser un Stripe ID avec vos différents produits et utilisateurs de votre app, pour pouvoir suivre statistiquement tout ce qui se rapporte aux paiements, dans votre base de données comme sur le tableau de bord Stripe.
- Automatiser la gestion des factures.
- Intégrer un "webhook" à votre séquence de paiement. Pour un ordre d'idée, c'est une sorte de partie de ping-pong qui s'engage entre votre serveur et celui de Stripe. Je n'ai pas trouvé mieux pour imager 😅
- Intégrer un modèle de paiement d'abonnement, dont Stripe coordonne la temporalité.
- ...