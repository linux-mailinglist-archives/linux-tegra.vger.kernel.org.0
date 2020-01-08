Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 197BC134769
	for <lists+linux-tegra@lfdr.de>; Wed,  8 Jan 2020 17:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbgAHQOd (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 8 Jan 2020 11:14:33 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37617 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727390AbgAHQOd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Jan 2020 11:14:33 -0500
Received: by mail-oi1-f195.google.com with SMTP id z64so3105189oia.4
        for <linux-tegra@vger.kernel.org>; Wed, 08 Jan 2020 08:14:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SrlaliDEGGOH4VVc2RtqMQylQGZdgoDQmUqlf4dPj7U=;
        b=WKh1nIVs+Kooeky6K8ku1nqq+R5ZIQElQJ8mmFKNFhM3SeHc3MbQinLf9xz2wcFwI7
         PlbuBVsbv9butgNMiRoIeutLTfU0FSf8Ozyl1Je0aV/TL31I/sjQzsOiHm6ypTGpdC8m
         HwbtzIud+3KQJa7uWAKmchY1+DhRSZvHmCC0aLo4bLPhSiQj7WMaUkOrux/MYHRZYV/h
         t4gTTUIzo+z58iWGAwC2uZhXK4KYGG/3ckRIwubqSf32NGhaamyOQJETLcc19sxmHntv
         j0h+Y/+gmkvekb0hXlCcqxyNePr/1yYIUYPAmoH9WgH7QHzhBsSe6ONAfVJ0yQiDl04S
         u5LA==
X-Gm-Message-State: APjAAAWZZ77NBHzHFrVjd7V8kWSV0sDGxSv/buOiSn/M+be+UqInYrzU
        iiMOPAr1TtEkE7nhs9/qrgSe3qc=
X-Google-Smtp-Source: APXvYqyvN66vLbSA8HBljc6MApei+BmsrBjvYrD2h5bGlTg6QPnruGx4QW946FYP52OrlM9eA4LS1w==
X-Received: by 2002:a05:6808:b13:: with SMTP id s19mr3429315oij.119.1578500072013;
        Wed, 08 Jan 2020 08:14:32 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n2sm1196629oia.58.2020.01.08.08.14.31
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2020 08:14:31 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 220333
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Wed, 08 Jan 2020 10:14:30 -0600
Date:   Wed, 8 Jan 2020 10:14:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/13] dt-bindings: memory: Add Tegra186 memory client IDs
Message-ID: <20200108161430.GA8334@bogus>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
 <20191222141035.1649937-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191222141035.1649937-2-thierry.reding@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 22 Dec 2019 15:10:23 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add IDs for the memory clients found on NVIDIA Tegra186 SoCs. This will
> be used to describe interconnect paths from devices to system memory.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  include/dt-bindings/memory/tegra186-mc.h | 139 +++++++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
