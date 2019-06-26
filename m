Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 878E856DAA
	for <lists+linux-tegra@lfdr.de>; Wed, 26 Jun 2019 17:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728249AbfFZPaQ (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 26 Jun 2019 11:30:16 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:34668 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbfFZPaQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jun 2019 11:30:16 -0400
Received: by mail-yw1-f68.google.com with SMTP id q128so1388744ywc.1
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 08:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OI9aIzSar/H++pHo3ABCXgtera7zbPDWP79XUKeGSqA=;
        b=A/6m2AfUaM8FQfjzYV679io+ByPmpGSlXSf8l939ZgeZ4V+EEHgPMyR28xn++Wf0dQ
         hEIpEFtpP014wQNNZeQJeIdLa6yb10Y/uQLedsc/IKSWEjPDt3jquHQg6LkpkhrrxDDi
         JavlllZi2a6edul2TGTs3BsRDCdack4eMNSn0Mnhy0QqEjeXPYTq2G3ikRs2qa/1dM8E
         6etoSXroQYjEPAFX6eSgAksfSXOxe6Tq/uTMLLl0cuSg1cMzX71dAdELISV2+t63Whk1
         5imOJXTWVsH3RNIEIJP73rmithlBhIcbcm2DBfsBm1UIhCRCVgoPQ3YvI6VmowgP6+WS
         G1XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OI9aIzSar/H++pHo3ABCXgtera7zbPDWP79XUKeGSqA=;
        b=EHwbD0JeV6EDAtBnMxBUaeTmqsRhCWAwGyVhEM6G35hv0tQKRCD7x3NAXWWkEZ/sio
         Aw2JgjO8gyOzhl7DdUHnz9aK6M6RXUM2OM/4Kb3k2hBiGCTHjZAeCSkSnuerR85MMGRq
         zMKHObWoghSpn6IDmY0Ct+IURvXYYfb8MXvb+IXcKBSVDI8Fi6XbaXeJSSSJqjZy/2uZ
         hlBQ6kqPCnLMEbtxS6eddwSDCKPX7vSYP1FMEzp5L1a3A/uuYm4zrRphFP8j+7bxm/KC
         SJIX3AfzXrENpx3NBDjB7CwqzFse1kAOiIDIvgfdwn1mKEJoFIHvLUZyjvph25Svt0c+
         Pbww==
X-Gm-Message-State: APjAAAXZGWRTPd3jaDqK2Mc5IkKXlZm6IxgJM8cSOqNqPTdmFur8cTIq
        F+VHZxZPdeIeb9z3dlJ3BU9qpLTK
X-Google-Smtp-Source: APXvYqzezjDeN2jj0Wz9PXdW8RNw9AgIC2asYJRTXfEJNy+TQ+miLgUGzS9b0Q1u2YbO1bV1ZM3jhQ==
X-Received: by 2002:a81:5fd4:: with SMTP id t203mr3045023ywb.300.1561563014884;
        Wed, 26 Jun 2019 08:30:14 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id 73sm2651873ywd.88.2019.06.26.08.30.12
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 08:30:12 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id n3so1585229ybn.0
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jun 2019 08:30:12 -0700 (PDT)
X-Received: by 2002:a25:aa48:: with SMTP id s66mr2818152ybi.46.1561563012097;
 Wed, 26 Jun 2019 08:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190626102322.18821-1-jonathanh@nvidia.com> <20190626104525.GH6362@ulmo>
In-Reply-To: <20190626104525.GH6362@ulmo>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Wed, 26 Jun 2019 11:29:36 -0400
X-Gmail-Original-Message-ID: <CA+FuTSfWnen_t9r=BghkzzBwy=b_wazvtjPwg0ALtq30Cv-BGw@mail.gmail.com>
Message-ID: <CA+FuTSfWnen_t9r=BghkzzBwy=b_wazvtjPwg0ALtq30Cv-BGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: stmmac: Fix possible deadlock when disabling EEE support
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Network Development <netdev@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jun 26, 2019 at 6:45 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Jun 26, 2019 at 11:23:21AM +0100, Jon Hunter wrote:
> > When stmmac_eee_init() is called to disable EEE support, then the timer
> > for EEE support is stopped and we return from the function. Prior to
> > stopping the timer, a mutex was acquired but in this case it is never
> > released and so could cause a deadlock. Fix this by releasing the mutex
> > prior to returning from stmmax_eee_init() when stopping the EEE timer.
> >
> > Fixes: 74371272f97f ("net: stmmac: Convert to phylink and remove phylib logic")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
> >  1 file changed, 1 insertion(+)
>
> Tested-by: Thierry Reding <treding@nvidia.com>

Acked-by: Willem de Bruijn <willemb@google.com>
