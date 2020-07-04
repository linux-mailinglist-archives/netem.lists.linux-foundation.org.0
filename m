Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A39CF22CD6B
	for <lists.netem@lfdr.de>; Fri, 24 Jul 2020 20:24:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 486E488A7E;
	Fri, 24 Jul 2020 18:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pcrya9wuaVtI; Fri, 24 Jul 2020 18:24:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B51FD88BAC;
	Fri, 24 Jul 2020 18:23:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85CCDC004F;
	Fri, 24 Jul 2020 18:23:24 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6AD6C0733
 for <netem@lists.linux-foundation.org>; Sat,  4 Jul 2020 14:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A58AF883D5
 for <netem@lists.linux-foundation.org>; Sat,  4 Jul 2020 14:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DqQaf8gmhuv4 for <netem@lists.linux-foundation.org>;
 Sat,  4 Jul 2020 14:46:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com
 [209.85.217.42])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2AF9E883D4
 for <netem@lists.linux-foundation.org>; Sat,  4 Jul 2020 14:46:15 +0000 (UTC)
Received: by mail-vs1-f42.google.com with SMTP id r5so18426406vso.11
 for <netem@lists.linux-foundation.org>; Sat, 04 Jul 2020 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=w4AhkJjpr/14gbLCoO3CzpkA3e9eyZyQ/cKB+DcQZ4A=;
 b=bAU/UoS+bDh4vBf8s4FEkMBGwbL5Wf2b2zTshAmiYN82Q61R3WQ701irBOMXh6fmwN
 K4ZyWK7AdTxPtRBD20/cr5eG/caIQ781zMj2rKtfYmtbkgLS8PiDUznP5nmPpt5eq+Dq
 P7wvtEdaB7JZwMAlyewzpk1T/TqBp72vki2YEWOgxw7T/XfFxjLcYkJ7NQhMG/Nkge63
 xH3q2pFpX3gEEuWmMWueuNKQAoR9lGsV/HiD/bGIjbcpJzSrZ0Gs4SZ7U+ts7BmliHo0
 hqz/1sAEobyTH620aoFgfoOJnRiO74SmltTtCzPPWT9Ej1QwT3Etk1POI7G0g7ySoE61
 pCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=w4AhkJjpr/14gbLCoO3CzpkA3e9eyZyQ/cKB+DcQZ4A=;
 b=ihpZEOxq+caekc6DpXj6D8aelrpTybJhRBLrEa4TjUo0XYScsVZvd6HHoXxChY487A
 mVEuxAITSuQUASU2DFc64l6o/dx5h4lnEY8u6Q6DS7Sj4vFXUGoG5UWaVhsbhDa0bmwO
 d7uO+8pIaUxbBhI9ppcDmtI2jbgJE5l2xFyE0vIPk4yujM8ppnpvwp+DW9rsYy9ddh+O
 pxUh9PAjKcfQhAvPwovoK2jWAF0mrSjBUizz1W8lZG1zRZ0pxzml7qDlJ3wZ9uFSXhzd
 dLRyCCHmUzXqdO6i4LOPx2Vq0eL8R9/eHh/n+5I0gJz5lI3tr8BkDxBIDUggWM19ZSZ9
 833Q==
X-Gm-Message-State: AOAM532kECEg7ZcnDS4tefmIzaesImbHcD+PDvr++tLf0O1YNtMo6/h9
 z9nIAQL3e/HOG9yLF5twrlNtwjH7cSdV309V3k0v5w==
X-Google-Smtp-Source: ABdhPJwMG/PcmBE2XdcwXy29w95tMe6Q6PMYTL9iIbyUa9Zw4aurrHk8yCtQU+MrdD4S8tccWF/qOB6Tc5vojDDhN0k=
X-Received: by 2002:a67:ec58:: with SMTP id z24mr24800446vso.109.1593873973723; 
 Sat, 04 Jul 2020 07:46:13 -0700 (PDT)
MIME-Version: 1.0
From: Daniel Garrido <gararda@gmail.com>
Date: Sat, 4 Jul 2020 16:46:01 +0200
Message-ID: <CANH2sShZ-2h-mQmLii5GUVfcLpg2nOxxJ8-0Z6jvvVoJRYbyEw@mail.gmail.com>
To: netem@lists.linux-foundation.org
X-Mailman-Approved-At: Fri, 24 Jul 2020 18:23:22 +0000
Subject: [Netem] NetEm drops TCP but not UDP packets
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
Content-Type: multipart/mixed; boundary="===============7235404137302204306=="
Errors-To: netem-bounces@lists.linux-foundation.org
Sender: "Netem" <netem-bounces@lists.linux-foundation.org>

--===============7235404137302204306==
Content-Type: multipart/alternative; boundary="000000000000054a0905a99eb4b5"

--000000000000054a0905a99eb4b5
Content-Type: text/plain; charset="UTF-8"

Hi.

I have a running WANem 3.0 beta 2 which uses NetEm. I can apply delay with
no problem, but when I try to to add loss, only TCP packets are dropped,
but not UDP. I have verified this behaviour with IPerf (TCP and UDP) an
D-IGT (UDP).

I don't know what can be the problem, and this is my first contact with
NetEm. Can anyone helo me with this?

Best regards.

--000000000000054a0905a99eb4b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><p style=3D"font-family:sans-serif;font-size:12.8px">Hi.<=
/p><p style=3D"font-family:sans-serif;font-size:12.8px">I have a running WA=
Nem 3.0 beta 2 which uses NetEm. I can apply delay with no problem, but whe=
n I try to to add loss, only TCP packets are dropped, but not UDP. I have v=
erified this behaviour with IPerf (TCP and UDP) an D-IGT (UDP).</p><p style=
=3D"font-family:sans-serif;font-size:12.8px">I don&#39;t know what can be t=
he problem, and this is my first contact with NetEm. Can anyone helo me wit=
h this?</p><p style=3D"font-family:sans-serif;font-size:12.8px">Best regard=
s.</p></div>

--000000000000054a0905a99eb4b5--

--===============7235404137302204306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
--===============7235404137302204306==--
