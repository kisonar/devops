# 1 Add User to the AD Group of GitHub Organization

# 2 Verify Access Through SSO Link:
https://github.com/orgs/<org_name>/sso

# 3 Enable Single Sign-On (SSO) on User Personal Access Tokens (PATs) and SSH Keys
Users should enable SSO on their PATs and SSH keys for secure access.
Generate SSH key locally and copy the public key and add it into the Github SSH keys
ssh-keygen -t rsa -b 4096 -C "<email>"

To set SSO, go to User >> Settings >> SSH and GPG keys >> New SSH Key
Paste the above copied public key and save.
Once the Auth key available, click Configure SSO and click Authorize on particular organization.

To enable SSO on PATs, go to User >> Settings >> Developer settings >> Personal access tokens and set SSO on PATs.
Once the PAT available, click Configure SSO and click Authorize on particular organization.

# 4 Verify Repository Accessibility:
Verify user accessibility to organization repositories by executing a push command. 
Users need the 'Maintain' role assignment to perform push commands on repositories.