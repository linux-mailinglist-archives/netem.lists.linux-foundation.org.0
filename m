Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9891A145F1A
	for <lists.netem@lfdr.de>; Thu, 23 Jan 2020 00:23:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 41AC586AB2;
	Wed, 22 Jan 2020 23:23:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrGVWHtvDsOG; Wed, 22 Jan 2020 23:23:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7D90886ADF;
	Wed, 22 Jan 2020 23:23:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61ACFC0176;
	Wed, 22 Jan 2020 23:23:23 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 989D1C077D
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:30:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 84A2C86B0B
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oEPyfSzrHRJA for <netem@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:30:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D8F5986A0C
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:30:14 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D4BC24734;
 Thu, 16 Jan 2020 17:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579195814;
 bh=X/lr2loGzOXrhQ1zAVOept7gtbPCYsrVXmgybcoBkpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sO3T8mD2cnkv3cxnKC7RTZO/X6LPceH+XsjcDDb6B8uJVz/ow9osIdNLIgc4CpqHs
 +L+DjzQ6D/A+4QgwmUriyGv1CJBJp8opbOWdGKaauUuOV5iABJjml3tA1scQY+mQx1
 L/Lb3GdT/x2XmK5iv2esAPipeeLltHdBMxCCvCA8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:23:17 -0500
Message-Id: <20200116172403.18149-268-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116172403.18149-1-sashal@kernel.org>
References: <20200116172403.18149-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Wed, 22 Jan 2020 23:23:06 +0000
Cc: Sasha Levin <sashal@kernel.org>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Simon Horman <simon.horman@netronome.com>, netem@lists.linux-foundation.org,
 netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: [Netem] [PATCH AUTOSEL 4.14 325/371] net: netem: correct the
	parent's backlog when corrupted packet was dropped
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: netem-bounces@lists.linux-foundation.org
Sender: "Netem" <netem-bounces@lists.linux-foundation.org>

From: Jakub Kicinski <jakub.kicinski@netronome.com>

[ Upstream commit e0ad032e144731a5928f2d75e91c2064ba1a764c ]

If packet corruption failed we jump to finish_segs and return
NET_XMIT_SUCCESS. Seeing success will make the parent qdisc
increment its backlog, that's incorrect - we need to return
NET_XMIT_DROP.

Fixes: 6071bd1aa13e ("netem: Segment GSO packets on enqueue")
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Simon Horman <simon.horman@netronome.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/sched/sch_netem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 64c3cfa35736..328b043edf07 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -603,6 +603,8 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		}
 		/* Parent qdiscs accounted for 1 skb of size @prev_len */
 		qdisc_tree_reduce_backlog(sch, -(nb - 1), -(len - prev_len));
+	} else if (!skb) {
+		return NET_XMIT_DROP;
 	}
 	return NET_XMIT_SUCCESS;
 }
-- 
2.20.1

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
