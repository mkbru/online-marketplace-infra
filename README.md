# E-Commerce Application CI/CD Pipeline


<img width="600" alt="pipeline" src="https://github.com/mkbru/online-marketplace-infra/blob/master/pics-for-gh/Untitled%20Diagram.png">


## Challenges

1. Automating Infrastructure (Terraform) 
https://github.com/mkbru/online-marketplace-infra/tree/master/infrastructure

2. Automating Application Updates (Google Cloud Build) 
https://github.com/mkbru/online-marketplace/blob/master/cloudbuild.yaml

3. Testing (Travis CI) 
https://github.com/mkbru/online-marketplace/blob/master/.travis.yml

4. Secrets Management (Kubernetes)
https://github.com/mkbru/online-marketplace-infra/blob/master/application/deployment.tf#L32-L50 <br />
https://github.com/mkbru/online-marketplace-infra/blob/master/kubernetes/deployment.yaml#L23-L43

Future Improvements

1. Reduce manual work for deploying Kubernetes secrets
2. Automate deploying Kubernetes yaml files
3. Automating grabbing new cluster credentials after new cluster spin up
4. Only pushing image in Cloud Build after merge to master is complete
