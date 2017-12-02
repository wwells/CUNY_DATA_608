## Gun Violence App

Final project hosted at:  http://gunviolence.waltwells.com/
Final project repository: https://github.com/wwells/shiny-apps/tree/master/gunviolence

### Deploy Using Docker

Pull from Quay

```
docker pull quay.io/wwells/gunviolence
```

Run application

```
sudo docker run --rm  -p 80:80 --name gunviolence quay.io/wwells/gunviolence
```