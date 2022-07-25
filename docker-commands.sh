Step 1: Build and push the image to registry
    docker build --no-cache -t regserver.bossman.pro/myportfoliowebsite:latest .; docker push regserver.bossman.pro/myportfoliowebsite:latest
Step 2: log into docker-server
    ssh jotbrar@10.0.0.37
    password: tARMAnca
Step 3: stop the current running container
    docker-compose -f gaganPortfolio-compose.yml kill
Step 4: Delete the stopped container:
    docker-compose -f gaganPortfolio-compose.yml rm -f
Step 5: Pull the new image from the registry
    docker-compose -f gaganPortfolio-compose.yml pull
Step 6: Run the container with the new change
    docker-compose -f gaganPortfolio-compose.yml up -d
Step 7: Verify by going to the website
    https://gurkanwaljot.pro
Step 8: Verify by ssh-ing into the container
    docker exec -ti gagan-portfolio bash