Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E51028BE38
	for <lists+linux-tegra@lfdr.de>; Mon, 12 Oct 2020 18:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403844AbgJLQnr (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Mon, 12 Oct 2020 12:43:47 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40589 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403782AbgJLQnr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Oct 2020 12:43:47 -0400
Received: by mail-ed1-f67.google.com with SMTP id p13so17705196edi.7;
        Mon, 12 Oct 2020 09:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=btBZVZqxtWI3fuInlzEdZDm6KMtgsylPsMWQD9V4zcU=;
        b=SUllY70smH5ucMbxTn8eJvN0TW/GB4YZBq1OjmUDTN49Hc5zacxQaVwWZ66wdJa7nR
         eNswY0xrXF7uZ+eZGBK610IuuqBqqHSeq2QatamRovdrV3O0sf+GH2FZZdOi+AGlxvcD
         zI/jA3qK8PFoUJUZz1Ld29EOgmgPwJ5jrSLipziMkY40AE8mpxtDmMF0TqJFnvwgNkSp
         FF1CcO5sLkh4wuHjEb1fhohk3U1ueR+Yx8RSdUrm5QYvF1xZWQ4evYp8IH2+IseHnqVR
         wA7u9EIS3Dsz3p4d56uiS/2Q9EOmzQb2Ajh3XTsz+fDeKoXkiTbQ+6uuRRaIoFM1qm/8
         Es6A==
X-Gm-Message-State: AOAM530B7jgER0HtD6ssWpqe4KV8mZZt7nisQCsJFAMZ6z3u1kkEMHNw
        HRggncQ6Qk3K8ebnv+Xa5Dw=
X-Google-Smtp-Source: ABdhPJy83MPzuSNmmNVuVbEVbI50fmUXELVcQJIDTkSuGz3Qa+Derhs51xqlTZOO4i3RL6jwPsc2ug==
X-Received: by 2002:a05:6402:3133:: with SMTP id dd19mr13178133edb.100.1602521023802;
        Mon, 12 Oct 2020 09:43:43 -0700 (PDT)
Received: from kozik-lap ([194.230.155.215])
        by smtp.googlemail.com with ESMTPSA id m19sm10771438ejj.91.2020.10.12.09.43.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 09:43:42 -0700 (PDT)
Date:   Mon, 12 Oct 2020 18:43:40 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Message-ID: <20201012164340.GA3557@kozik-lap>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-4-nicoleotsuka@gmail.com>
 <20201008103258.GA16358@kozik-lap>
 <20201008202615.GA32140@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008202615.GA32140@Asurada-Nvidia>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Oct 08, 2020 at 01:26:16PM -0700, Nicolin Chen wrote:
> Hi Krzysztof,
> 
> On Thu, Oct 08, 2020 at 12:32:58PM +0200, Krzysztof Kozlowski wrote:
> > On Wed, Oct 07, 2020 at 05:37:44PM -0700, Nicolin Chen wrote:
> > > This is a cleanup change to prepare for new swgroups.
> > 
> > What type of cleanup? Any functional change?
> 
> It's to sort the swgroup list by reg address as I mentioned in
> the subject. Perhaps I should have put in commit message also.

Indeed it is sorted by regs, I missed some numbers... looks good. I can
adjust the commit msg so no need for resend.

Best regards,
Krzysztof
