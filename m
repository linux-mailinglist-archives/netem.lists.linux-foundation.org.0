Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 070BC4A732
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:40:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DBE2BE31;
	Tue, 18 Jun 2019 16:38:29 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 648D0A95
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 22:33:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 176E8180
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 22:33:10 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id v11so6544437pgl.5
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 15:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mvpMcAU4IlTvoMtZwQO9v3Uk8QuLJ2xmdxsld5jOLeM=;
	b=vY7tQbidyQS64LOoqYLHv8TIJSaEzRM37+2PJMdZkDg8vANElZ3/ETy7WEEkOPnB9j
	s0vdZ4YlCNDb/eeJTtjbQ3oPrAQmWoS0zPANeuaRAS+pgYDTk6CEuHq5hF9PMkGjwOan
	G7bXH9gJPJXei8P4k9oatIpfdv+EIMlig+nNKjRrq3Z9dNmyYDmPI9SrJ5v9i/q3S9Gq
	Ym2uG6ZroQ4B6NT5w0mstWu0nczPsre8lUq3Mvflt08O7WXJx+paMnQnEzp8zKiRvkLg
	lY5f6COp0LY9i+Ba11flnwKGJd+1P65jvkDmGP+NyRRyvzXCM53Yum8c1uVRl8+htria
	OP3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mvpMcAU4IlTvoMtZwQO9v3Uk8QuLJ2xmdxsld5jOLeM=;
	b=eKe0qSWBfIvEW/VTzhXFkVdIv+FSFqzijkuAWMoHVMPwer2fSbj1XsUh3wsBbel9zr
	o8orgqMRrz7waXxNPGxZl1AVl9Imn9y9TDGk/dvnzeo0HxBNNpWgrRGxWjWJV15MIDEE
	nX9Yu/SNi32EVbKepbpn4l0NXu/tfoMiw4Rw3ZN7qRRbuj7vR+Eh4MXoMEWH1BNB8H3v
	3+uKwnnI0Y+gRD5GtkN6PQmXjkT+3qAQMpF/Pvzer7UI+1x15a29oibCoXX9tZzkRscC
	z+NrDfRaZuikb6+JBEgcj8j9tlOUeKmhnz/sII3bR6+oIwYBNH9lQq4ZzWhGbT7ftj0/
	x72A==
X-Gm-Message-State: APjAAAVQIAn5qYm8qjLOvxs9On4Ct6avtuZGD+xuS7daDvc0t+EX1VZk
	a71ypH9N5jYLqpzFAAS+jipv1yRAXD4iV6Rf+yI=
X-Google-Smtp-Source: APXvYqyCwsCVzJQiR2StbMKKVURUyI8mkPWMLl/znggAFIB+GpuL4iRrhh7JKNCCvfkFMoJPr7F7gz3KDWPs0K2c1Ow=
X-Received: by 2002:a17:90a:1d8:: with SMTP id 24mr1530663pjd.70.1560810789632;
	Mon, 17 Jun 2019 15:33:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190617181111.5025-1-jakub.kicinski@netronome.com>
	<20190617181111.5025-2-jakub.kicinski@netronome.com>
In-Reply-To: <20190617181111.5025-2-jakub.kicinski@netronome.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Mon, 17 Jun 2019 15:32:57 -0700
Message-ID: <CAM_iQpWa=mTo6JCffh5dX5Y=8Nq+xBMhG0AqDx+9KrfGXz8wZg@mail.gmail.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: Jiri Pirko <jiri@resnulli.us>, Neil Horman <nhorman@tuxdriver.com>,
	oss-drivers@netronome.com,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	netem@lists.linux-foundation.org, Jamal Hadi Salim <jhs@mojatatu.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Eric Dumazet <edumazet@google.com>, posk@google.com,
	David Miller <davem@davemloft.net>
Subject: Re: [Netem] [PATCH net v2 1/2] net: netem: fix backlog accounting
 for corrupted GSO frames
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

On Mon, Jun 17, 2019 at 11:11 AM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> When GSO frame has to be corrupted netem uses skb_gso_segment()
> to produce the list of frames, and re-enqueues the segments one
> by one.  The backlog length has to be adjusted to account for
> new frames.
>
> The current calculation is incorrect, leading to wrong backlog
> lengths in the parent qdisc (both bytes and packets), and
> incorrect packet backlog count in netem itself.
>
> Parent backlog goes negative, netem's packet backlog counts
> all non-first segments twice (thus remaining non-zero even
> after qdisc is emptied).
>
> Move the variables used to count the adjustment into local
> scope to make 100% sure they aren't used at any stage in
> backports.
>
> Fixes: 6071bd1aa13e ("netem: Segment GSO packets on enqueue")
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>

Looks good!

Acked-by: Cong Wang <xiyou.wangcong@gmail.com>
_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
