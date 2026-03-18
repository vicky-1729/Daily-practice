# WINGS for Incident Management (SmartOps) — Hosting Script

## SLIDE 1 — Opening (1–1.5 min)

Good [afternoon], everyone. Thank you for taking the time to join us today. We really appreciate you being here.

My name is Vaikunta Rao, and I will be your host for this session. I am excited to walk you through what we have been working on.

Today, we are going to talk about **WINGS for Incident Management**, which we call **SmartOps**.

This is built by the **CISS AI Infusion** Office. It is changing how we handle IT incidents.

**CISS** means **Cloud Infrastructure Services and Security**. It is one of the main business areas at Wipro. The **AI Infusion** Office is a team inside CISS. This team uses Generative AI to improve IT operations. SmartOps is one of their main products.

Let me give you some background.

Right now, when something goes wrong — like a server goes down or an app stops working — a ticket is created.
Then someone has to read that ticket, understand the problem, find the right information, and fix it.
This takes time. Sometimes it takes hours.
And while we wait, the business is affected.

So we asked one simple question — **what if AI could do most of this work for us?** Not to replace our engineers, but to help them. Let AI handle the repeated tasks, so engineers can focus on the real problems. That is what SmartOps does.

Let me explain how.

---

## SLIDE 2 — SmartOps Overview (2–3 min)

So, **what is SmartOps?**

SmartOps is a **Generative AI tool** built inside the **WINGS platform**. It is like an intelligent assistant that works inside your incident management workflow — it handles triage, context gathering, and resolution automatically.

Let me walk you through the three main things it does.

**First — Triage.**
When a new incident comes in, SmartOps reads the ticket — the description, the alerts, the metadata — and uses AI to understand the problem. Then it sends the ticket to the right team automatically. No guesswork, no tickets sitting in the wrong queue.

**Second — Enrichment.**
Once the ticket is assigned, SmartOps collects all the useful information — past incidents, runbook steps, configuration details, related alerts — and adds it directly to the ticket. So when an engineer picks it up, everything they need is already there.

**Third — Automated Remediation.**
When the problem is something we have seen before and we already know the fix — SmartOps does not wait for a person. It picks up the fix, runs it, checks that everything is working, and closes the ticket on its own.

One important thing — it works with the tools you already use — **ServiceNow** for ticketing, your **monitoring tools** like Dynatrace or Datadog, and your internal **knowledge bases** and runbooks. No changes needed to your current setup.

SmartOps is **live in production today**, handling real incidents for real customers. Our speakers will show you how it works and walk you through real examples.

---

## Transition to Slide 3 — Speakers Introduction

Now, let me introduce our two speakers.

First — **Sairam Varanasi**. Sairam is part of the **GenAI team**. He manages **SmartOps deployments** for our customers, overseeing the **complete deployment lifecycle** through **production readiness**. He works closely with our internal teams to **run demos** and **deploy SmartOps** into customer environments. He has strong hands-on experience with **cloud infrastructure**, **CI/CD pipelines**, and **production deployments**. He knows how to make things work in real customer setups.

Next — **Chaitanya Killamsetty**. Chaitanya belongs to the **Platform Engineering team**. He works as the **solution architect**, leading the **design and development** of our **GenAI solutions**. He has deep technical expertise in **AI/ML architecture**, **system design**, and **building scalable platforms**. From the AI models to the integrations to the backend — he is the one who brings all the pieces of SmartOps together. He is one of the strongest technical minds on our team.

I will now hand over to them. Please welcome Sairam and Chaitanya.

---

## Slide 4 — Q&A Closing

Thank you, Sairam and Chaitanya, for the great presentation.

Now we have time for questions. If you have any, please go ahead and ask. If you want to ask later, you can send an email to **Al.Infusion.ext@wipro.com** and we will be happy to help.

Thank you all for your time today.
