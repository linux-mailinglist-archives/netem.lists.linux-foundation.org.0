Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A884A722
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:38:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E858BCB1;
	Tue, 18 Jun 2019 16:38:08 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A28E3224F
	for <netem@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:52:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 25B7EE6
	for <netem@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 18:52:31 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id l128so11072085qke.2
	for <netem@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netronome-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+qRZCLWeYyL7AiMKUPOUUuUoHJTdcKKfTN9LYgXV6GA=;
	b=kkDcH8sYBK52aZhJz9cLUwG6gXGC3VP+Nom7SEPJ8F/z/gcrJ2geFZ/GkBj2287faT
	mWn9HmqMRZffObhYvumFGnZlT/mOdMbk+oSeHCJZergtImiIIWvyYJ5qOp/T+NJ/n3IP
	Ixsv4NS2OoSzKtg6c8TK5huw/r8rKJsG0sabIht05lFmpnt9ckIm6JlEmkXPDxjg0LV2
	fjeFP3A0rq10QZu8U5TUvNBYtOVltb5AqV0w1K1LNSogugQGKZgdijyyDcKFgHZiyNYg
	ZKbhIzwItrxVK6e8D4JQnxO3gHb7R++SnzmGAHGl0YFGKiy5s0h2UZR+IhyPPwkBRJRW
	orpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=+qRZCLWeYyL7AiMKUPOUUuUoHJTdcKKfTN9LYgXV6GA=;
	b=IEWgsPcwTSj8+Ti0yhfBJpLuH82hmji/OIgO2WLU2voit373NU3bz4QIgj7ZCcVR3K
	bMZSl7ALRqi8eTYZDz/1vZCtonXrVuf0LEPQechs9B2at7YOklhpenoYzx7s1UR4ynGS
	3nkyussN5VutBq3Hr+SSA5uQOxQSWvgs/Hedoj3017m0kgJGRIdDlCbG11g754xcDtCi
	tEb+9maF7YKU0Ni3bSF2Zvtl4P/kAP7Q9yvdtHyC40GoYkyKJ84bQEXnOsxALSCyB+er
	ulKqmxGSZTurYsih0tl6mP9S12dJCCjisuLBBXkrMCzn0NhU0ALCTYKlMjwJRneHrY0p
	HNQw==
X-Gm-Message-State: APjAAAUf7u0abD35kz0MXDb08ZnZQvRdfVxJ0T3xkBXpsm+GuepGvy0l
	2kC7S1Y69rKkEMdIiV6VEy8U3Q==
X-Google-Smtp-Source: APXvYqxdn/mEBBN4kebXpudyqKNEMKS0pz4lQ8LpzQNEERC4FKNU37F9Qu9OP5Ksvp9VrcytmTXYmw==
X-Received: by 2002:a37:ea16:: with SMTP id t22mr68504341qkj.337.1560365550264;
	Wed, 12 Jun 2019 11:52:30 -0700 (PDT)
Received: from jkicinski-Precision-T1700.netronome.com ([66.60.152.14])
	by smtp.gmail.com with ESMTPSA id u2sm303692qtj.97.2019.06.12.11.52.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Jun 2019 11:52:29 -0700 (PDT)
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: davem@davemloft.net
Date: Wed, 12 Jun 2019 11:51:21 -0700
Message-Id: <20190612185121.4175-1-jakub.kicinski@netronome.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: jiri@resnulli.us, oss-drivers@netronome.com, netdev@vger.kernel.org,
	netem@lists.linux-foundation.org, jhs@mojatatu.com,
	stephen@networkplumber.org, edumazet@google.com,
	xiyou.wangcong@gmail.com, posk@google.com
Subject: [Netem] [PATCH net] net: netem: fix use after free and double free
	with packet corruption
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux network emulator <netem.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/netem/>
List-Post: <mailto:netem@lists.linux-foundation.org>
List-Help: <mailto:netem-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: netem-bounces@lists.linux-foundation.org
Errors-To: netem-bounces@lists.linux-foundation.org

Brendan reports that the use of netem's packet corruption capability
leads to strange crashes.  This seems to be caused by
commit d66280b12bd7 ("net: netem: use a list in addition to rbtree")
which uses skb->next pointer to construct a fast-path queue of
in-order skbs.

Packet corruption code has to invoke skb_gso_segment() in case
of skbs in need of GSO.  skb_gso_segment() returns a list of
skbs.  If next pointers of the skbs on that list do not get cleared
fast path list goes into the weeds and tries to access the next
segment skb multiple times.

Reported-by: Brendan Galloway <brendan.galloway@netronome.com>
Fixes: d66280b12bd7 ("net: netem: use a list in addition to rbtree")
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
---
 net/sched/sch_netem.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 956ff3da81f4..1fd4405611e5 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -494,16 +494,13 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	 */
 	if (q->corrupt && q->corrupt >= get_crandom(&q->corrupt_cor)) {
 		if (skb_is_gso(skb)) {
-			segs = netem_segment(skb, sch, to_free);
-			if (!segs)
+			skb = netem_segment(skb, sch, to_free);
+			if (!skb)
 				return rc_drop;
-		} else {
-			segs = skb;
+			segs = skb->next;
+			skb_mark_not_on_list(skb);
 		}
 
-		skb = segs;
-		segs = segs->next;
-
 		skb = skb_unshare(skb, GFP_ATOMIC);
 		if (unlikely(!skb)) {
 			qdisc_qstats_drop(sch);
-- 
2.21.0

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
