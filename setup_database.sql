setup_database.sql
-- Create the 'education' table
CREATE TABLE education (
    id INT AUTO_INCREMENT PRIMARY KEY,
    school_name VARCHAR(255),
    degree VARCHAR(100),
    location VARCHAR(255),
    start_month VARCHAR(100),
    start_year INT,
    end_month VARCHAR(100),
    end_year INT,
    gpa DECIMAL(3, 2),
    coursework TEXT,
    activities TEXT
);

-- Populate the 'education' table
INSERT INTO education (school_name, degree, location, start_month, start_year, end_month, end_year, gpa, coursework, activities)
VALUES
('Massachusetts Institute of Technology', 'PhD in Artificial Intelligence', 'Cambridge, MA', 'August', 2023, 'May', 2028, 4.0, 'Advanced Machine Learning, Deep Learning, Natural Language Processing', 'AI Research Lab, Conference Speaker, Tech Workshops'),
('San Jose State University', 'Master of Science in Computer Science', 'San Jose, CA', 'August', 2021, 'May', 2023, 3.8, 
'Data Structures, Algorithms, Machine Learning, Distributed Systems', 
'AI Club, Hackathons, Teaching Assistant'),
('University of California, Berkeley', 'Bachelor of Science in Electrical Engineering and Computer Science', 'Berkeley, CA', 'August', 2015, 'May', 2019, 3.6, 
'Operating Systems, Computer Networks, Database Systems, Computer Vision', 
'Robotics Club, Research Assistant, IEEE Student Chapter');

-- Create the 'research_paper' table
CREATE TABLE research_paper (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paper_title VARCHAR(255),
    publication_name VARCHAR(255),
    publication_date DATE,
    author_names TEXT,
    description TEXT,
    paper_link VARCHAR(255)
);

-- Populate the 'research_paper' table
INSERT INTO research_paper (paper_title, publication_name, publication_date, author_names, description, paper_link)
VALUES
('Quantum Computing: The Next Frontier', 'Nature', '2023-03-05', 'James Powell, John Preskill', 
'Quantum computing is heralded as the next great leap in computational technology. This paper provides a comprehensive overview of the field, examining the theoretical foundations of quantum computing, the major breakthroughs in qubit design, and the ongoing challenges related to error correction and quantum coherence. The paper also discusses the implications of quantum algorithms, including Shor''s algorithm and Grover''s search algorithm, which promise exponential speedups over classical algorithms. Furthermore, the potential for quantum computers to revolutionize industries such as cryptography, drug discovery, and materials science is examined in detail, positioning quantum computing as the next frontier in both academic and industrial research.', 
'https://journals.flvc.org/FLAIRS/article/view/130580'),
('Ethics in AI and Autonomous Systems', 'Ethics and Information Technology', '2023-01-15', 'James Powell, Kate Crawford', 
'As artificial intelligence and autonomous systems continue to evolve, ethical considerations have become a critical area of discussion. This paper examines the ethical dilemmas posed by AI systems, focusing on issues such as algorithmic fairness, accountability, transparency, and privacy. The authors highlight real-world case studies where AI systems have led to unintended consequences, ranging from biased hiring algorithms to autonomous vehicle accidents. The paper also offers a framework for developing ethical AI systems, emphasizing the importance of stakeholder collaboration, regulatory oversight, and the creation of AI systems that align with human values and societal well-being. The future of AI governance and its impact on democracy, human rights, and the global economy is also discussed.', 
'https://ieeexplore.ieee.org/document/9891834'),
('Deep Learning in Natural Language Processing', 'Journal of AI Research', '2022-11-12', 'James Powell, Michael Jordan, Andrew Ng', 
'This paper offers an in-depth review of the cutting-edge advancements in deep learning models, particularly focusing on their application in natural language processing. The study covers the historical evolution of deep learning techniques, detailing key architectures such as recurrent neural networks (RNNs), convolutional neural networks (CNNs), and transformers. It further explains the role of attention mechanisms, BERT, GPT, and other transformative models that have redefined the boundaries of NLP. The authors also explore the societal impact of NLP applications, such as language translation, sentiment analysis, and automated text generation, while addressing challenges related to data biases and model interpretability.', 
'https://ieeexplore.ieee.org/document/10452793'),
('Blockchain Technology in Finance', 'IEEE Transactions on Finance', '2021-08-25', 'James Powell, Satoshi Nakamoto, Vitalik Buterin', 
'Blockchain has emerged as a revolutionary technology with the potential to disrupt traditional financial systems. This paper explores how decentralized ledger technologies, specifically blockchain, are reshaping the global financial landscape. The authors delve into blockchain''s foundational principles—decentralization, transparency, and immutability—and their relevance to financial applications such as cryptocurrencies, smart contracts, and decentralized finance (DeFi). Case studies of leading blockchain projects, including Bitcoin and Ethereum, are presented, highlighting their impact on cross-border transactions, asset tokenization, and financial inclusion. The paper also addresses the challenges posed by scalability, regulation, and energy consumption within blockchain ecosystems.', 
'https://journals.flvc.org/FLAIRS/article/view/130580'),
('Climate Change and Machine Learning', 'Science Advances', '2020-12-01', 'James Powell, Yann LeCun, Geoffrey Hinton', 
'As climate change poses an ever-growing threat to the planet, the role of machine learning in addressing this global crisis is increasingly important. This paper surveys the latest advancements in machine learning algorithms and their application in climate science, ranging from predictive modeling of climate patterns to the optimization of renewable energy grids. The authors discuss how ML techniques are being used to improve the accuracy of climate models, enhance climate resilience, and reduce greenhouse gas emissions through more efficient resource allocation. Additionally, the potential for machine learning to aid in environmental conservation efforts, such as monitoring deforestation and protecting biodiversity, is thoroughly explored.', 
'https://www.ijeat.org/portfolio-item/f37710811622/');

-- Create the 'research_projects' table
CREATE TABLE research_projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    project_title VARCHAR(255),
    affiliated_institute VARCHAR(255),
    start_month VARCHAR(50),
    start_year INT,
    end_month VARCHAR(50),
    end_year INT,
    description TEXT,
    technologies_used TEXT,
    project_link VARCHAR(255)
);

-- populate the 'research_projects' table
INSERT INTO research_projects (project_title, affiliated_institute, start_month, start_year, end_month, end_year, description, technologies_used, project_link)
VALUES
('Advanced NLP Techniques for Legal Text Mining', 'Massachusetts Institute of Technology', 'August', 2024, 'September', 2024, 
 'This project explores the development and implementation of advanced natural language processing (NLP) models to automate the extraction and analysis of legal documents. Focusing on legal text mining, it seeks to reduce the time and resources required to process large volumes of legal texts using machine learning and deep learning techniques.', 
 'Python, TensorFlow, Hugging Face, BERT', 'https://github.com/Ohreum-Kwon/muskip'),
('Quantum Cryptography for Secure Communications', 'San Jose State University', 'August', 2021, 'November', 2021, 
 'This project investigates the use of quantum cryptography to enhance the security of communication systems. By leveraging quantum key distribution and encryption techniques, the project aims to build a secure, future-proof communication protocol capable of withstanding potential quantum computer threats.', 
 'C++, Qiskit, OpenSSL', 'https://github.com/corinnachang/CS157A-Team4'),
('Blockchain for Smart Contract Auditing', 'University of California, Berkeley', 'March', 2018, 'October', 2018, 
 'This project focuses on using blockchain technology to create a secure auditing framework for smart contracts. The research aims to develop tools to automatically verify and audit smart contracts for vulnerabilities and errors before they are deployed to the blockchain.', 
 'Solidity, Ethereum, Truffle, Ganache', 'https://github.com/Atishaysjain/orcale-tuning-index-recommendation-tool'),
('AI-driven Climate Change Modeling', 'University of California, Berkeley', 'January', 2018, 'May', 2018, 
 'This project aims to enhance the accuracy of climate change models by integrating artificial intelligence techniques. The goal is to predict long-term environmental changes, improve climate resilience, and provide data-driven insights for policy makers to mitigate climate-related risks.', 
 'Python, Keras, TensorFlow, Climate Data API', 'https://github.com/Atishaysjain/flash_drought_prediction'),
('Ethics Framework for AI in Autonomous Vehicles', 'University of California, Berkeley', 'April', 2017, 'December', 2017, 
 'This project investigates the ethical challenges posed by autonomous vehicles and AI decision-making systems. The research aims to develop a comprehensive framework that ensures autonomous vehicle technologies are safe, fair, and accountable.', 
 'Python, ROS, OpenAI Gym, Ethical AI Framework', 'https://github.com/SynBioDex/pySBOL3');

-- Create the 'work_experience' table
CREATE TABLE work_experience (
    id INT AUTO_INCREMENT PRIMARY KEY,
    organization_name VARCHAR(255),
    job_title VARCHAR(255),
    location VARCHAR(255),
    start_month VARCHAR(50),
    start_year INT,
    end_month VARCHAR(50),
    end_year INT,
    responsibilities TEXT,
    achievements TEXT
);

-- Populate the 'work_experience' table
INSERT INTO work_experience (organization_name, job_title, location, start_month, start_year, end_month, end_year, responsibilities, achievements)
VALUES
('Google', 'Software Engineering Intern', 'Mountain View, CA', 'May', 2023, 'August', 2023, 
'Developed and optimized back-end services to enhance system scalability. Implemented APIs and microservices using Java and deployed them on Kubernetes. Worked closely with the DevOps team to streamline CI/CD pipelines. Conducted unit and integration testing to ensure API reliability.', 
'Improved system performance by 20% through optimizations in API handling and introduced new testing frameworks that reduced bugs by 15%'),
('Facebook', 'Data Science Intern', 'Menlo Park, CA', 'May', 2022, 'August', 2022, 
'Analyzed user engagement data to provide actionable insights for the product team. Built machine learning models for predicting user behavior. Collaborated with cross-functional teams to optimize key product features. Developed dashboards to monitor daily active user growth and engagement.', 
'Built a recommendation system that increased user engagement by 12% and led to a 10% increase in daily active users for a core feature.'),
('Apple', 'Software Engineer', 'Cupertino, CA', 'June', 2020, 'May', 2021, 
'Developed and maintained key components of the iOS platform. Improved the user interface and system-level performance. Led a project that reduced app load times by 15%. Collaborated with cross-functional teams to ensure high-quality releases.', 
'Led a project that decreased application load times by 15%, enhancing user experience across millions of devices.'),
('Tesla', 'Full Stack Engineer', 'Fremont, CA', 'July', 2019, 'June', 2020, 
'Developed full-stack web applications for internal tools. Improved automation in manufacturing processes by collaborating with cross-functional teams. Built dashboards to reduce factory downtime and increase data processing speed. Optimized front-end and back-end workflows for better performance.', 
'Implemented a new manufacturing dashboard that reduced factory downtime by 30% and increased data processing speed by 25%');

-- Create the 'certifications' table
CREATE TABLE certifications (
    id INT AUTO_INCREMENT PRIMARY KEY,
    certification_title VARCHAR(255),
    issuing_organization VARCHAR(255),
    issue_date DATE,
    expiry_date DATE,
    score VARCHAR(50),
    duration VARCHAR(50),
    description TEXT
);

-- Populate the 'certifications' table
INSERT INTO certifications (certification_title, issuing_organization, issue_date, expiry_date, score, duration, description)
VALUES
('AWS Certified Solutions Architect – Associate', 'Amazon Web Services', '2021-07-15', '2024-07-15', '900/1000', '2 months', 
'Certification focused on designing scalable and reliable applications on AWS, including architecture best practices and cloud infrastructure.'),
('Google Cloud Professional Data Engineer', 'Google Cloud', '2022-05-10', '2025-05-10', '850/1000', '3 months', 
'Demonstrated expertise in designing data processing systems and building data pipelines on Google Cloud.'),
('Microsoft Certified: Azure AI Engineer Associate', 'Microsoft', '2020-09-20', '2023-09-20', '920/1000', '2 months', 
'Specialized in integrating AI solutions into Azure-based applications, focusing on natural language processing, speech, computer vision, and bots.'),
('Certified Kubernetes Administrator (CKA)', 'Cloud Native Computing Foundation', '2021-11-05', '2024-11-05', '875/1000', '2 months', 
'Certified in managing and orchestrating containerized applications using Kubernetes, with a focus on cluster management and troubleshooting.');

-- Create the 'awards' table
CREATE TABLE awards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    award_title VARCHAR(255),
    award_date DATE,
    competition_name VARCHAR(255),
    description TEXT
);

-- Populating the 'awards' table
INSERT INTO awards (award_title, award_date, competition_name, description)
VALUES
('Best Hackathon Project', '2022-03-15', 'HackTech 2022', 
'Awarded for developing a machine learning-powered healthcare solution that predicts disease risk using patient data, won 1st place out of 200 teams.'),
('Top Performer in Computer Science', '2021-05-20', 'University Annual Awards', 
'Recognized as the top-performing student in the Computer Science department with the highest GPA and contributions to several research projects.'),
('Best Innovative Solution', '2020-11-10', 'TechCrunch Hackathon', 
'Won the award for developing an innovative blockchain-based payment system that simplifies cross-border transactions and ensures security.'),
('Most Impactful Hack', '2021-07-25', 'Major League Hacking Summer Hack', 
'Recognized for developing a sustainability-focused app that tracks and reduces personal carbon footprints, chosen from among 150 participating teams.');

-- Create the 'club_activities' table
CREATE TABLE club_activities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    club_name VARCHAR(255),
    position VARCHAR(255),
    responsibilities TEXT
);

-- Populating the 'club_activities' table
INSERT INTO club_activities (club_name, position, responsibilities)
VALUES
('AI Research Lab', 'Research Member', 
 'Conducted research on the application of deep learning models to healthcare problems. Published papers on AI-driven diagnostics and presented findings at conferences.'),
('Hackathons', 'Team Leader', 
 'Led a team of students in various hackathons, developing innovative solutions using machine learning and data science. Secured multiple top finishes.'),
('Robotics Club', 'Project Lead', 
 'Led the design and implementation of autonomous robots for campus competitions, focusing on integrating machine learning algorithms into control systems.'),
('IEEE Student Chapter', 'Vice President', 
 'Organized and led technical workshops on electronics, programming, and circuit design for the student body. Coordinated events with industry professionals.'),
('Teaching Assistant', 'Graduate Assistant', 
 'Assisted professors with grading, led study sessions, and provided mentoring to students in machine learning and data structures courses.');
